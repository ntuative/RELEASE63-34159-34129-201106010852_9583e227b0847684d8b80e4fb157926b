package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var var_1991:String;
      
      private var var_1989:String;
      
      private var var_1990:String;
      
      private var _name:String;
      
      private var var_1100:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         this.var_1991 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         this.var_1989 = _loc5_[0];
         this.var_1990 = _loc5_[1];
         this._name = param2;
         this.var_1100 = param3;
      }
      
      public function get id() : String
      {
         return this.var_1991 + "_" + this.var_1989 + "." + this.var_1990;
      }
      
      public function get languageCode() : String
      {
         return this.var_1991;
      }
      
      public function get countryCode() : String
      {
         return this.var_1989;
      }
      
      public function get encoding() : String
      {
         return this.var_1990;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get url() : String
      {
         return this.var_1100;
      }
   }
}
