import { config } from 'dotenv';
config();

const dbconfig = {
  server: process.env.SQLServer,
  authentication: {
    type: 'default',
    options: {
      userName: process.env.User,
      password: process.env.Password,
      trustedConnection: false,
      enableArithAbort:  true
    }
  },
  options: {
    encrypt: false,
    database: process.env.Database
  }
};
   
export default dbconfig;
