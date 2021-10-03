package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_743:TileHeightMap = null;
      
      private var var_1154:LegacyWallGeometry = null;
      
      private var var_1155:RoomCamera = null;
      
      private var var_745:SelectedRoomObjectData = null;
      
      private var var_744:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_511:Map;
      
      private var var_512:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_511 = new Map();
         this.var_512 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1154 = new LegacyWallGeometry();
         this.var_1155 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_743;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_743 != null)
         {
            this.var_743.dispose();
         }
         this.var_743 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1154;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1155;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_745;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_745 != null)
         {
            this.var_745.dispose();
         }
         this.var_745 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_744;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_744 != null)
         {
            this.var_744.dispose();
         }
         this.var_744 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_743 != null)
         {
            this.var_743.dispose();
            this.var_743 = null;
         }
         if(this.var_1154 != null)
         {
            this.var_1154.dispose();
            this.var_1154 = null;
         }
         if(this.var_1155 != null)
         {
            this.var_1155.dispose();
            this.var_1155 = null;
         }
         if(this.var_745 != null)
         {
            this.var_745.dispose();
            this.var_745 = null;
         }
         if(this.var_744 != null)
         {
            this.var_744.dispose();
            this.var_744 = null;
         }
         if(this.var_511 != null)
         {
            this.var_511.dispose();
            this.var_511 = null;
         }
         if(this.var_512 != null)
         {
            this.var_512.dispose();
            this.var_512 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_511.remove(param1.id);
            this.var_511.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_511.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_511.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_511.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_512.remove(param1.id);
            this.var_512.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_512.length > 0)
         {
            return this.getWallItemDataWithId(this.var_512.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_512.remove(param1);
      }
   }
}
