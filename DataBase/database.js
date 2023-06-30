import dbconfig from './dbconfig.js';
import sql from 'mssql';

async function Execute(procedureName, params) {
      return new Promise(async (resolve, reject) => {
      try{
        await sql.connect(dbconfig, async err => {
            if (err)
                reject(err);

            let request = new sql.Request();
            for (const param in params) {
              request.input(param, params[param]);
            }
            await request.execute(procedureName, (err, result) => {
              if (err)
                reject(err);
      
              if (result)
                resolve(result.recordsets);
            });
        });
      }
      catch (error) {
        console.log(`Error in database.Execute()\nError: ${error}`);
        throw error;
      }
    })
}

async function ExecuteNonQuery(procedureName, params) {
  try{
    await sql.connect(dbconfig, async () => {
        let request = new sql.Request();
        for (const param in params) {
          request.input(param, params[param]);
        }
        await request.execute(procedureName);
    });
  }
  catch (error) {
    console.log(`Error in database.ExecuteNonQuery()\nError: ${error}`);
    throw error;
  }
}


export const _Execute = Execute;
export const _ExecuteNonQuery = ExecuteNonQuery;