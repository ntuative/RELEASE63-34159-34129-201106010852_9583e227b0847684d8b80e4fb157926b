package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1070:BigInteger;
      
      private var var_2859:BigInteger;
      
      private var var_2120:BigInteger;
      
      private var var_2939:BigInteger;
      
      private var var_1633:BigInteger;
      
      private var var_2121:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1633 = param1;
         this.var_2121 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1633.toString() + ",generator: " + this.var_2121.toString() + ",secret: " + param1);
         this.var_1070 = new BigInteger();
         this.var_1070.fromRadix(param1,param2);
         this.var_2859 = this.var_2121.modPow(this.var_1070,this.var_1633);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_2120 = new BigInteger();
         this.var_2120.fromRadix(param1,param2);
         this.var_2939 = this.var_2120.modPow(this.var_1070,this.var_1633);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2859.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2939.toRadix(param1);
      }
   }
}
