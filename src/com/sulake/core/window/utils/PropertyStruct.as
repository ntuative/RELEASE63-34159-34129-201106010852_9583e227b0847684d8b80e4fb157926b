package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_157:String = "hex";
      
      public static const const_42:String = "int";
      
      public static const const_245:String = "uint";
      
      public static const const_128:String = "Number";
      
      public static const const_36:String = "Boolean";
      
      public static const const_53:String = "String";
      
      public static const const_244:String = "Point";
      
      public static const const_283:String = "Rectangle";
      
      public static const const_140:String = "Array";
      
      public static const const_288:String = "Map";
       
      
      private var var_614:String;
      
      private var var_180:Object;
      
      private var _type:String;
      
      private var var_2480:Boolean;
      
      private var var_2980:Boolean;
      
      private var var_2479:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_614 = param1;
         this.var_180 = param2;
         this._type = param3;
         this.var_2480 = param4;
         this.var_2980 = param3 == const_288 || param3 == const_140 || param3 == const_244 || param3 == const_283;
         this.var_2479 = param5;
      }
      
      public function get key() : String
      {
         return this.var_614;
      }
      
      public function get value() : Object
      {
         return this.var_180;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2480;
      }
      
      public function get range() : Array
      {
         return this.var_2479;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_157:
               return "0x" + uint(this.var_180).toString(16);
            case const_36:
               return Boolean(this.var_180) == true ? "true" : "false";
            case const_244:
               return "Point(" + Point(this.var_180).x + ", " + Point(this.var_180).y + ")";
            case const_283:
               return "Rectangle(" + Rectangle(this.var_180).x + ", " + Rectangle(this.var_180).y + ", " + Rectangle(this.var_180).width + ", " + Rectangle(this.var_180).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_288:
               _loc3_ = this.var_180 as Map;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_140:
               _loc4_ = this.var_180 as Array;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_244:
               _loc5_ = this.var_180 as Point;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_283:
               _loc6_ = this.var_180 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_614 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_42 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_157:
               _loc1_ = "<var key=\"" + this.var_614 + "\" value=\"" + "0x" + uint(this.var_180).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_614 + "\" value=\"" + this.var_180 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
