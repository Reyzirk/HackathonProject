using System;
using System.Security.Cryptography;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Net.Mail;

namespace CoreDLL
{
    public class CoreDLL
    {
        public static Boolean comparePassword(string passwordSalt, string inputPassword, string truePassword)
        {
            String inputHashed = hashPassword(inputPassword, passwordSalt);
            Console.WriteLine(inputHashed);
            Console.WriteLine(truePassword);
            return inputHashed.Equals(truePassword);
        }
        public static String hashPassword(String input, String salt)
        {
            byte[] bytes = Encoding.UTF8.GetBytes(input + salt);
            SHA256Managed hashString = new SHA256Managed();
            byte[] hash = hashString.ComputeHash(bytes);
            return Convert.ToBase64String(hash);
        }

        public static string generateSalt()
        {
            var random = new RNGCryptoServiceProvider();

            //Max salt length
            int max_length = 32;

            //Empty salt array
            byte[] salt = new byte[max_length];

            //Build random bytes
            random.GetNonZeroBytes(salt);

            //return the encoded salt
            return Convert.ToBase64String(salt);
        }
        private static Boolean validCard(String input)
        {
            input = input.Replace("-", "");
            int[] card = new int[input.Length];
            for (int i = 0; i < input.Length; i++)
            {
                card[i] = (int)(input[i] - '0'); //In ASCII, digit number is not 0-9
            }
            for (int i = input.Length - 2; i >= 0; i -= 2)
            {
                int temp = card[i];//Store the value in the variable to process in future, to prevent interrupt original number
                temp = temp * 2;
                if (temp > 9)
                {
                    temp = temp % 10 + 1;
                }
                card[i] = temp;
            }
            int total = 0;
            for (int i = 0; i < input.Length; i++)
            {
                total += card[i];
            }
            //Valid credit number will contains 0 remainder
            if (total % 10 == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /* Check Credit Card number whether following "xxxx-xxxx-xxxx-xxxx"
         * valid = return true
         * invalid = return false
         */
        public static Boolean checkCardNumber(String input)
        {
            Regex rgx = new Regex(@"[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{4}");
            if (rgx.IsMatch(input))
            {
                if (validCard(input))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        public static Boolean checkEmail(String input)
        {
            try
            {
                MailAddress m = new MailAddress(input);
                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        //Check whether if file type is valid
        public static Boolean checkFileType(String input)
        {
            switch (input)
            {
                case "image/bmp":
                    return true;
                case "image/gif":
                    return true;
                case "image/jpeg":
                    return true;
                case "image/png":
                    return true;
                default:
                    return false;
            }
        }

        //Converts valid file type into proper file extension
        public static String convertFileType(String input)
        {
            switch (input)
            {
                case "image/bmp":
                    return ".bmp";
                case "image/gif":
                    return ".gif";
                case "image/jpeg":
                    return "jpg";
                case "image/png":
                    return "png";
                default:
                    return "";
            }
        }
    }
}
