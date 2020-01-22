using System;
using System.Text;
using System.Security.Cryptography;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Capstone_UI
{
    public class hashing
    {
        public hashing()
        {

        }
        public string getHash(string param)
        {
            var hashString = new StringBuilder();
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] hashByte = sha256Hash.ComputeHash(Encoding.ASCII.GetBytes(param));
                for(int i = 0; i < hashByte.Length; i++)
                {
                    hashString.Append(hashByte[i].ToString("x2"));
                }
            }
            return hashString.ToString();
        }
    }
}