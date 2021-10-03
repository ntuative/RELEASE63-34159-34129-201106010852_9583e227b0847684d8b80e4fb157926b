package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_66:String = "i";
      
      public static const const_79:String = "s";
      
      public static const const_214:String = "e";
       
      
      private var var_1409:String;
      
      private var var_2631:int;
      
      private var var_1142:String;
      
      private var var_1410:int;
      
      private var var_1712:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1409 = param1.readString();
         this.var_2631 = param1.readInteger();
         this.var_1142 = param1.readString();
         this.var_1410 = param1.readInteger();
         this.var_1712 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1409;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2631;
      }
      
      public function get extraParam() : String
      {
         return this.var_1142;
      }
      
      public function get productCount() : int
      {
         return this.var_1410;
      }
      
      public function get expiration() : int
      {
         return this.var_1712;
      }
   }
}
