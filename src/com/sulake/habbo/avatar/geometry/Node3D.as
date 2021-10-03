package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_455:Vector3D;
      
      private var var_2011:Vector3D;
      
      private var var_2788:Boolean = false;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         this.var_2011 = new Vector3D();
         super();
         this.var_455 = new Vector3D(param1,param2,param3);
         if(param1 != 0 || param2 != 0 || param3 != 0)
         {
            this.var_2788 = true;
         }
      }
      
      public function get location() : Vector3D
      {
         return this.var_455;
      }
      
      public function get transformedLocation() : Vector3D
      {
         return this.var_2011;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         if(this.var_2788)
         {
            this.var_2011 = param1.vectorMultiplication(this.var_455);
         }
      }
   }
}
