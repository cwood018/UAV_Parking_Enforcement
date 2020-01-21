import cv2
import numpy as np
import sys
import os
import math
from os.path import isfile, join

def process_video():
    # print(cv2.__version__)

    # Set to true to save all images
    save_all_images = False

    # set working directory
    work_dir = '/Users/christopherwood/PycharmProjects/ProjectFinal/Frames'
    os.chdir(work_dir)

    # this is where files for the alpr script are output
    output_dir = '/Users/christopherwood/PycharmProjects/ProjectFinal/Output'

    # set video input directory
    vid_dir = sys.argv[1]

    # opens video file
    cap = cv2.VideoCapture(vid_dir)

    # set counter for frame numbering
    i=0

    # while video still has frames
    while(cap.isOpened()):
        ret, frame = cap.read()
        # if ret is false, end of video
        # TESTING: Will stop at 10 frames DELETE i == 10 for full video
        if ret == False:# or i == 60:
            break
        # rotate frame 180 degrees
        image = cv2.rotate(frame, cv2.ROTATE_180)
        #cv2.imwrite('frame'+str(i)+'.jpg',image)

        #convert to gray
        gray_image = cv2.cvtColor(image,cv2.COLOR_BGR2GRAY)
        #cv2.imwrite('gray'+str(i)+'.jpg',gray_image)
        # kernel size for erosion and dilation 5x5 is standard
        kernel = np.ones((5,5),np.uint8)
        # erosion first then dilation seems to work best so far
        # best setting so far ero=5 dil=4
        erosion = cv2.erode(gray_image,kernel,iterations = 4)
        dilation = cv2.dilate(erosion,kernel,iterations = 3)

        # this kernal size is for the gaussianblur
        kernel_size = 5
            # performing gaussian blur on dilation image
        blur_gray = cv2.GaussianBlur(dilation,(kernel_size, kernel_size),0)
            # saving image to drive for preview
        if save_all_images is True:
            cv2.imwrite('blur_gray'+str(i)+'.jpg',blur_gray)
        # setting thresholds for Canny edge detection
        low_threshold = 50
        high_threshold = 150
        edges = cv2.Canny(dilation, low_threshold, high_threshold)
        # saving edge detection image for preview
        if save_all_images is True:
            cv2.imwrite('edges'+str(i)+'.jpg',edges)
        # this is saving dimensions of the image and then printing them out for reference: can delete later
        image_dimensions = image.shape
        height = image.shape[0]
        width = image.shape[1]

        # vertices is for creating a mask on the image to focus on on part of the image for the rest of process
        # could probably implement earlier
        vertices = np.array([[(0,height),(0,600),(350, 150), (950, 150),(width,600) ,(width,height),(1130,height),(950,550),(250,550),(150,height)]], dtype=np.int32)

        mask = np.zeros_like(blur_gray)
        # setting mask color
        ignore_mask_color=255
        cv2.fillPoly(mask, vertices, ignore_mask_color)
        # does bitwise operation on edges using mask
        cv2.bitwise_and(edges, mask)
        # this may be redundant might need to delete the previous line
        masked_edges = cv2.bitwise_and(edges, mask)
        
        # saves image of masked_edges to directory for preview
        #if save_all_images is True:
        #cv2.imwrite('masked_edges'+str(i)+'.jpg',masked_edges)

        rho = 2 # distance resolution in pixels of the Hough grid
        theta = np.pi/180 # angular resolution in radians of the Hough grid
        threshold = 15     # minimum number of votes (intersections in Hough grid cell)
        min_line_length = 100 #minimum number of pixels making up a line
        max_line_gap = 10    # maximum gap in pixels between connectable line segments
        line_image = np.copy(image)*0 # creating a blank to draw lines on

        # perfroming houghlinesP on image
        lines = cv2.HoughLinesP(masked_edges, rho, theta, threshold, np.array([]),min_line_length, max_line_gap)

        # calculates lines and draws them onto image
        rside = False
        lside = False
        if lines is not None:
            for line in lines:
                for x1,y1,x2,y2 in line:
                    angle = math.atan2(x2-x1,y2-y1)
                    angle = angle * 180 / math.pi
                    if angle > 130 or angle < 50 and x1 > 50 and x1 < 160 or x1 > 1120 and x1 < 1250:
                        cv2.line(line_image,(x1,y1),(x2,y2),(20,255,57),10)
                        if x1 > 50 and x1 < 160 :
                            lside= True
                        elif x1 > 1120 and x1 < 1250 :
                            rside= True
                        else:
                            pass
        else:
            pass
        if rside and lside :  
            cv2.imwrite('/Users/christopherwood/PycharmProjects/ProjectFinal/Output/frame'+str(i)+'.jpg',image)
            lines_edges = cv2.addWeighted(image, 0.8, line_image, 1, 0) # adds weight to lines
            # cv2.imwrite('line_weighted'+str(i)+'.jpg',lines_edges)# saves weighted lines to image for preview
        #print(*left_right_list, sep = '\n')
        # adds weight to lines 
        #lines_edges = cv2.addWeighted(image, 0.8, line_image, 1, 0)
        # saves weighted lines to image for preview
        #cv2.imwrite('line_weighted'+str(i)+'.jpg',lines_edges)

        # increment counter
        i=i+1

    # close video file
    cap.release()
    cv2.destroyAllWindows()

# End of process_video()
###################################################################################################################
if __name__ == '__main__':
    process_video()

