package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2092:int = 16777215;
      
      public static const const_1309:int = 8191;
      
      public static const const_1341:int = 8191;
      
      public static const const_2115:int = 1;
      
      public static const const_1312:int = 1;
      
      public static const const_1316:int = 1;
      
      private static var var_514:uint = 0;
      
      private static var var_513:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1309)
         {
            param2 = const_1309;
         }
         else if(param2 < const_1312)
         {
            param2 = const_1312;
         }
         if(param3 > const_1341)
         {
            param3 = const_1341;
         }
         else if(param3 < const_1316)
         {
            param3 = const_1316;
         }
         super(param2,param3,param4,param5);
         ++var_514;
         var_513 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_514;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_513;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_513 -= width * height * 4;
            --var_514;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
