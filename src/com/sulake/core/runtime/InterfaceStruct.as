package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1527:IID;
      
      private var var_1948:String;
      
      private var var_110:IUnknown;
      
      private var var_817:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1527 = param1;
         this.var_1948 = getQualifiedClassName(this.var_1527);
         this.var_110 = param2;
         this.var_817 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1527;
      }
      
      public function get iis() : String
      {
         return this.var_1948;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_110;
      }
      
      public function get references() : uint
      {
         return this.var_817;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_110 == null;
      }
      
      public function dispose() : void
      {
         this.var_1527 = null;
         this.var_1948 = null;
         this.var_110 = null;
         this.var_817 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_817;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_817) : uint(0);
      }
   }
}
