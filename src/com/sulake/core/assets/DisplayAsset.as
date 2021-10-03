package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_1100:String;
      
      protected var var_178:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_896:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_896 = param1;
         this.var_1100 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1100;
      }
      
      public function get content() : Object
      {
         return this.var_178;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get method_1() : AssetTypeDeclaration
      {
         return this.var_896;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_178.loaderInfo != null)
            {
               if(this.var_178.loaderInfo.loader != null)
               {
                  this.var_178.loaderInfo.loader.unload();
               }
            }
            this.var_178 = null;
            this.var_896 = null;
            this._disposed = true;
            this.var_1100 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            this.var_178 = param1 as DisplayObject;
            if(this.var_178 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            this.var_178 = DisplayAsset(param1).var_178;
            this.var_896 = DisplayAsset(param1).var_896;
            if(this.var_178 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            this.var_178 = DisplayAsset(param1).var_178;
            this.var_896 = DisplayAsset(param1).var_896;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
