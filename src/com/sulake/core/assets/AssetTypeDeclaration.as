package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2473:String;
      
      private var var_2472:Class;
      
      private var var_2471:Class;
      
      private var var_1806:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2473 = param1;
         this.var_2472 = param2;
         this.var_2471 = param3;
         if(rest == null)
         {
            this.var_1806 = new Array();
         }
         else
         {
            this.var_1806 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2473;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2472;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2471;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1806;
      }
   }
}
