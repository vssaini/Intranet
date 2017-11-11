using System;
using System.Web;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

/// <summary>
/// Provides method for connection to database
/// </summary>
public class DAL
{
    public DAL()
    {
    }

    static string conString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;

    public static OleDbConnection GetConnection()
    {
        OleDbConnection con = new OleDbConnection(conString);
        return con;
    }

    public static int ExecuteScalar(string query)
    {
        int number = 0;
        OleDbConnection con = GetConnection();

        using (OleDbCommand cmd = new OleDbCommand(query, con))
        {
            con.Open();
            if ((cmd.ExecuteScalar()) != null)
                number = (Int32)cmd.ExecuteScalar();
            con.Close();
        }
        return number;
    }

    public static string ExecuteStringScalar(string query)
    {
        string result = null;
        OleDbConnection con = GetConnection();

        using (OleDbCommand cmd = new OleDbCommand(query, con))
        {
            con.Open();
            if ((cmd.ExecuteScalar()) != null)
                result = cmd.ExecuteScalar().ToString();
            con.Close();
        }
        return result;
    }

    public static int ExecuteQuery(string query)
    {
        int number = 0;
        OleDbConnection con = GetConnection();

        using (OleDbCommand cmd = new OleDbCommand(query, con))
        {
            con.Open();
            number = cmd.ExecuteNonQuery();
            con.Close();
        }
        return number;
    }

    public static DataSet GetDataSet(string query, string table)
    {
        OleDbDataAdapter da;
        OleDbConnection con = GetConnection();
        DataSet ds = new DataSet();

        using (OleDbCommand cmd = new OleDbCommand(query, con))
        {
            da = new OleDbDataAdapter(cmd);
            con.Open();
            da.Fill(ds, table);
            con.Close();
        }
        return ds;
    }
}


