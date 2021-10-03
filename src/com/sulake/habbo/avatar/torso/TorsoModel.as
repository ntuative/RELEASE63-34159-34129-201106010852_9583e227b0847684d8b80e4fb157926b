package com.sulake.habbo.avatar.torso
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   
   public class TorsoModel extends CategoryBaseModel implements IAvatarEditorCategoryModel
   {
       
      
      public function TorsoModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory(FigureData.const_267);
         initCategory(FigureData.const_202);
         initCategory(FigureData.CHEST_ACCESSORIES);
         initCategory(FigureData.const_250);
         var_198 = true;
         if(!_view)
         {
            _view = new TorsoView(this,controller.windowManager,controller.assets);
            if(_view)
            {
               _view.init();
            }
         }
      }
   }
}
