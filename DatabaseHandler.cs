using CvSPROG7311PoE.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CvSPROG7311PoE
{
    public class DatabaseHandler
    {
        private FarmCentralEntities1 Entity;

        // private readonly string ConnectionString = Settings.Default.IliumDBServerConnectionString;

        /// <summary>
        ///     SQL Command
        /// </summary>
        private SqlCommand Command;

        /// <summary>
        ///     SQL Connection
        /// </summary>
        private SqlConnection Connection;

        //----------------------------------------------------------------------------------------------------------------//
        /// <summary>
        ///     Method Returns a Customer Name Based on the Customer ID
        ///     - Primary Key in the Table
        /// </summary>
        /// <param name="customerID"></param>
        /// <returns></returns>
        public bool DoesUsernameExist(string username)
        {
            try
            {
                using (this.Entity = new FarmCentralEntities1())
                {
                    Password PasswordCheck = Entity.Passwords.FirstOrDefault(l => string.Compare(l.Username, username, true) == 0);

                    if (PasswordCheck != null)
                        return false;
                }
                return true;
            }
            catch (Exception e)
            {
                return true;
            }


        }
        public bool DoesPasswordExist(string password)
        {
            try
            {
                using (this.Entity = new FarmCentralEntities1())
                {
                    Password PasswordCheck = Entity.Passwords.FirstOrDefault(l => string.Compare(l.Password1, password, true) == 0);

                    if (PasswordCheck != null)
                        return false;
                }
                return true;
            }
            catch (Exception e)
            {
                return true;
            }


        }
    }

}