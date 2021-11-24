using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Finexus_Hackathon.Objects
{
    public class User
    {
        private String userID;
        private String name;
        private String email;
        private String password;
        private String passwordSalt;
        private String ipAddress;

        public string Name { get => name; set => name = value; }
        public string Email { get => email; set => email = value; }
        public string Password { get => password; set => password = value; }
        public string UserID { get => userID; set => userID = value; }
        public string PasswordSalt { get => passwordSalt; set => passwordSalt = value; }
        public string IpAddress { get => ipAddress; set => ipAddress = value; }
    }
}