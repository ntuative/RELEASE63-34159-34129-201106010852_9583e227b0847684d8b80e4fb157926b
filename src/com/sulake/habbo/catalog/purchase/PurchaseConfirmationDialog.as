package com.sulake.habbo.catalog.purchase
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ICheckBoxWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.club.ClubBuyOfferData;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.communication.messages.parser.catalog.IsOfferGiftableMessageParser;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.ui.Keyboard;
   
   public class PurchaseConfirmationDialog implements IGetImageListener, IDisposable
   {
       
      
      private var _catalog:HabboCatalog;
      
      private var _roomEngine:IRoomEngine;
      
      private var _localization:ICoreLocalizationManager;
      
      private var var_1250:int;
      
      private var var_1516:int;
      
      private var var_1517:String;
      
      private var var_234:Array;
      
      private var var_265:IWindowContainer;
      
      private var var_800:IWindowContainer;
      
      private var var_375:int = -1;
      
      private const const_2260:int = 10;
      
      private var var_2652:String = "";
      
      private var var_1924:Boolean;
      
      private var var_1926:Boolean;
      
      private var var_1515:int;
      
      private var var_1925:Array;
      
      private var var_801:Array;
      
      private var var_802:Array;
      
      private var var_374:int;
      
      private var var_376:int;
      
      private var var_1249:int;
      
      private const const_2003:uint = 4.293848814E9;
      
      private const const_2004:uint = 4.294967295E9;
      
      private const const_1541:uint = 4.291613146E9;
      
      private var _window:IFrameWindow;
      
      private var _disposed:Boolean = false;
      
      public function PurchaseConfirmationDialog(param1:ICoreLocalizationManager)
      {
         this.var_801 = [];
         this.var_802 = [];
         super();
         this._localization = param1;
      }
      
      public function showOffer(param1:IHabboCatalog, param2:IRoomEngine, param3:IPurchasableOffer, param4:int, param5:String = "", param6:Array = null) : void
      {
         this._catalog = param1 as HabboCatalog;
         this._roomEngine = param2;
         this.var_1250 = param3.offerId;
         this.var_1516 = param4;
         this.var_1517 = param5;
         this.var_234 = param6;
         this.showConfirmationDialog(param3);
         this._catalog.syncPlacedOfferWithPurchase(param3);
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this._catalog = null;
         this._roomEngine = null;
         this.var_1250 = -1;
         this.var_1516 = -1;
         this.var_1517 = "";
         this.var_234 = null;
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_265 = null;
         if(this.var_800 != null)
         {
            this.var_800.dispose();
            this.var_800 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function onIsOfferGiftable(param1:IsOfferGiftableMessageParser) : void
      {
         if(this.disposed)
         {
            return;
         }
         if(this.var_1250 != param1.offerId)
         {
            return;
         }
         this.setGiftButtonState(param1.isGiftable);
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(param1 == this.var_1515)
         {
            this.var_1515 = 0;
            this.setImage(param2,true);
         }
      }
      
      private function setImage(param1:BitmapData, param2:Boolean) : void
      {
         if(this._window == null || param1 == null || this.disposed)
         {
            return;
         }
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.bitmap != null)
         {
            _loc3_.bitmap.dispose();
            _loc3_.bitmap = null;
         }
         if(_loc3_.bitmap == null)
         {
            _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         }
         var _loc4_:int = (_loc3_.width - param1.width) * 0.5;
         var _loc5_:int = (_loc3_.height - param1.height) * 0.5;
         _loc3_.bitmap.draw(param1,new Matrix(1,0,0,1,_loc4_,_loc5_));
         if(param2)
         {
            param1.dispose();
         }
      }
      
      private function showConfirmationDialog(param1:IPurchasableOffer) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         if(this._catalog == null)
         {
            return;
         }
         if(this._window != null)
         {
            this._window.dispose();
         }
         this.updateLocalizations(param1);
         this._window = this.createWindow("purchase_confirmation") as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IWindow = this._window.findChildByName("buy_button");
         if(_loc2_ != null)
         {
            _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onBuyButtonClick);
         }
         var _loc3_:IWindow = this._window.findChildByName("gift_button");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onGiftButtonClick);
         }
         var _loc4_:IWindow = this._window.findChildByName("cancel_button");
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
         var _loc5_:IWindow = this._window.findChildByName("header_button_close");
         if(_loc5_ != null)
         {
            _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClose);
         }
         this.setGiftButtonState(false);
         this._window.center();
         var _loc6_:ITextWindow = this._window.findChildByName("product_name") as ITextWindow;
         if(_loc6_ != null)
         {
            _loc8_ = this._catalog.getProductData(param1.localizationId);
            _loc6_.text = _loc8_ == null ? "" : _loc8_.name;
         }
         var _loc7_:IBitmapWrapperWindow = this._window.findChildByName("product_image") as IBitmapWrapperWindow;
         if(_loc7_ != null)
         {
            _loc9_ = param1.page.viewer.roomEngine;
            _loc12_ = 0;
            _loc13_ = "";
            _loc14_ = "";
            if(param1 is Offer)
            {
               _loc15_ = param1.productContainer.firstProduct;
               _loc14_ = _loc15_.productType;
               _loc12_ = _loc15_.productClassId;
               _loc13_ = _loc15_.extraParam;
            }
            else if(param1 is ClubBuyOfferData)
            {
               _loc14_ = "null";
            }
            switch(_loc14_)
            {
               case ProductTypeEnum.const_79:
                  _loc10_ = _loc9_.getFurnitureIcon(_loc12_,this);
                  break;
               case ProductTypeEnum.const_66:
                  _loc10_ = _loc9_.getWallItemIcon(_loc12_,this,_loc13_);
                  break;
               case ProductTypeEnum.const_214:
                  _loc11_ = this._catalog.getPixelEffectIcon(_loc12_);
                  break;
               case ProductTypeEnum.const_336:
                  _loc11_ = this._catalog.getSubscriptionProductIcon(_loc12_);
            }
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.data;
               this.var_1515 = _loc10_.id;
            }
            this.setImage(_loc11_,true);
         }
      }
      
      private function setGiftButtonState(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = IButtonWindow(this._window.findChildByName("gift_button"));
         if(param1)
         {
            _loc2_.enable();
         }
         else
         {
            _loc2_.disable();
         }
      }
      
      private function updateLocalizations(param1:IPurchasableOffer) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IProductData = this._catalog.getProductData(param1.localizationId);
         var _loc3_:String = _loc2_ == null ? "" : _loc2_.name;
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","offer_name",_loc3_);
         var _loc4_:BalanceAndCost = new BalanceAndCost(this._catalog,this._localization,param1);
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.costs","price",_loc4_.cost);
         this._catalog.windowManager.registerLocalizationParameter("catalog.purchase.confirmation.dialog.amount","amount",_loc4_.balance);
         _loc4_.dispose();
      }
      
      private function showGiftDialog() : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(this._window != null)
         {
            this._window.dispose();
         }
         var _loc1_:GiftWrappingConfiguration = this._catalog.giftWrappingConfiguration;
         var _loc2_:String = !!_loc1_.isEnabled ? "gift_wrapping" : "gift_no_wrapping";
         this._window = this.createWindow(_loc2_) as IFrameWindow;
         if(this._window == null)
         {
            return;
         }
         this._window.center();
         var _loc3_:IWindow = this._window.findChildByName("give_gift_button");
         if(_loc3_ != null)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onGiveGiftButtonClick);
         }
         var _loc4_:IWindow = this._window.findChildByName("cancel_gifting_button");
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCancelGift);
         }
         var _loc5_:IWindow = this._window.findChildByName("header_button_close");
         if(_loc5_ != null)
         {
            _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onCancelGift);
         }
         var _loc6_:ITextFieldWindow = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc6_ != null)
         {
            _loc6_.addEventListener(WindowEvent.const_113,this.onNameInputChange);
            _loc6_.addEventListener(WindowMouseEvent.const_44,this.onNameInputMouseDown);
            _loc6_.addEventListener(WindowKeyboardEvent.const_346,this.onNameInputKeyUp);
         }
         var _loc7_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc7_ != null)
         {
            _loc7_.addEventListener(WindowMouseEvent.const_44,this.onMessageInputMouseDown);
            _loc7_.addEventListener(WindowEvent.const_347,this.onMessageInputFocus);
         }
         this.var_1924 = true;
         this.var_1926 = true;
         if(_loc1_.isEnabled)
         {
            _loc8_ = this._window.findChildByName("ribbon_prev");
            if(_loc8_ != null)
            {
               _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPreviousGiftWrap);
            }
            _loc9_ = this._window.findChildByName("ribbon_next");
            if(_loc9_ != null)
            {
               _loc9_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onNextGiftWrap);
            }
            _loc10_ = this._window.findChildByName("box_prev");
            if(_loc10_ != null)
            {
               _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPreviousGiftBox);
            }
            _loc11_ = this._window.findChildByName("box_next");
            if(_loc11_ != null)
            {
               _loc11_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onNextGiftBox);
            }
            _loc12_ = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
            if(_loc12_ != null)
            {
               _loc12_.addEventListener(WindowEvent.const_335,this.onFreeWrappingSelected);
               _loc12_.addEventListener(WindowEvent.const_524,this.onFreeWrappingUnSelect);
            }
            _loc13_ = this._window.findChildByName("use_free_text");
            if(_loc13_ != null)
            {
               _loc13_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onGiftWrappingUseFreeTextClicked);
            }
            this._localization.registerParameter("catalog.gift_wrapping.price","price",_loc1_.price.toString());
            this.var_1925 = _loc1_.stuffTypes;
            this.var_802 = _loc1_.boxTypes;
            this.var_801 = _loc1_.ribbonTypes;
            this.var_1249 = this.var_1925[0];
            this.var_376 = this.var_802[0];
            this.var_374 = this.var_801[0];
            this.initColorGrid();
            this.updateColorGrid();
            this.updatePreview();
         }
      }
      
      private function updatePreview() : void
      {
         if(this.var_374 < 0)
         {
            this.var_374 = this.var_801.length - 1;
         }
         if(this.var_374 > this.var_801.length - 1)
         {
            this.var_374 = 0;
         }
         if(this.var_376 < 0)
         {
            this.var_376 = this.var_802.length - 1;
         }
         if(this.var_376 > this.var_802.length - 1)
         {
            this.var_376 = 0;
         }
         var _loc1_:int = this.var_802[this.var_376] * 1000 + this.var_801[this.var_374];
         if(this._window == null)
         {
            return;
         }
         if(this._roomEngine == null)
         {
            return;
         }
         var _loc2_:ImageResult = this._roomEngine.getFurnitureImage(this.var_1249,new Vector3d(180),64,this,0,_loc1_.toString());
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1515 = _loc2_.id;
         this.setImage(_loc2_.data,true);
         this.showSuggestions(false);
      }
      
      private function initColorGrid() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = this._window.findChildByName("color_grid") as IItemGridWindow;
         _loc1_.destroyGridItems();
         var _loc2_:IWindowContainer = this.createWindow("gift_palette_item") as IWindowContainer;
         for each(_loc3_ in this.var_1925)
         {
            _loc4_ = this._catalog.getFurnitureData(_loc3_,ProductTypeEnum.const_79);
            _loc5_ = _loc2_.clone() as IWindowContainer;
            if(!(!_loc4_ || !_loc5_))
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onColorItemClick);
               _loc6_ = uint(_loc4_.colours[0]);
               _loc7_ = (_loc6_ >> 16 & 255) / 255;
               _loc8_ = (_loc6_ >> 8 & 255) / 255;
               _loc9_ = (_loc6_ & 255) / 255;
               _loc10_ = new ColorTransform(_loc7_,_loc8_,_loc9_);
               this.setBitmapData(_loc5_,"border","ctlg_clr_27x22_1");
               this.setBitmapData(_loc5_,"color","ctlg_clr_27x22_2",_loc10_);
               this.setBitmapData(_loc5_,"selection","ctlg_clr_27x22_3");
               _loc5_.id = _loc3_;
               _loc1_.addGridItem(_loc5_);
            }
         }
      }
      
      private function setBitmapData(param1:IWindowContainer, param2:String, param3:String, param4:ColorTransform = null) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc5_:IBitmapWrapperWindow = param1.findChildByName(param2) as IBitmapWrapperWindow;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:BitmapDataAsset = this._catalog.assets.getAssetByName(param3) as BitmapDataAsset;
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:BitmapData = _loc6_.content as BitmapData;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc5_.bitmap == null)
         {
            _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,0);
         }
         _loc5_.bitmap.draw(_loc7_,null,param4);
      }
      
      private function createWindow(param1:String) : IWindow
      {
         if(this._catalog.windowManager == null || this._catalog.assets == null)
         {
            return null;
         }
         var _loc2_:XmlAsset = this._catalog.assets.getAssetByName(param1) as XmlAsset;
         if(_loc2_ == null || _loc2_.content == null)
         {
            return null;
         }
         return this._catalog.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function giveGift() : void
      {
         var _loc1_:ITextFieldWindow = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:String = _loc1_.text;
         var _loc3_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         var _loc4_:String = _loc3_ == null ? "" : _loc3_.text;
         var _loc5_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         var _loc6_:Boolean = _loc5_ == null ? false : Boolean(_loc5_.isSelected);
         var _loc7_:int = !!_loc6_ ? 0 : int(this.var_1249);
         var _loc8_:int = !!_loc6_ ? 0 : int(this.var_802[this.var_376]);
         var _loc9_:int = !!_loc6_ ? 0 : int(this.var_801[this.var_374]);
         this._catalog.purchaseProductAsGift(this.var_1516,this.var_1250,this.var_1517,_loc2_,_loc4_,_loc7_,_loc8_,_loc9_);
      }
      
      private function onBuyButtonClick(param1:WindowEvent) : void
      {
         this._catalog.purchaseProduct(this.var_1516,this.var_1250,this.var_1517);
         this.dispose();
      }
      
      private function onGiftButtonClick(param1:WindowEvent) : void
      {
         this.showGiftDialog();
      }
      
      private function onClose(param1:WindowEvent) : void
      {
         this._catalog.resetPlacedOfferData();
         this.dispose();
      }
      
      private function onGiveGiftButtonClick(param1:WindowEvent) : void
      {
         this.giveGift();
         this.enableGiftButton(false);
         this._catalog.resetPlacedOfferData();
      }
      
      private function onCancelGift(param1:WindowEvent) : void
      {
         this._catalog.resetPlacedOfferData();
         this.dispose();
      }
      
      private function onPreviousGiftWrap(param1:WindowEvent) : void
      {
         --this.var_374;
         this.updatePreview();
      }
      
      private function onNextGiftWrap(param1:WindowEvent) : void
      {
         ++this.var_374;
         this.updatePreview();
      }
      
      private function onPreviousGiftBox(param1:WindowEvent) : void
      {
         --this.var_376;
         this.updatePreview();
      }
      
      private function onNextGiftBox(param1:WindowEvent) : void
      {
         ++this.var_376;
         this.updatePreview();
      }
      
      private function onGiftWrappingUseFreeTextClicked(param1:WindowEvent) : void
      {
         this.toggleCheckbox();
      }
      
      private function toggleCheckbox() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ == null)
         {
            return;
         }
         if(_loc1_.isSelected)
         {
            _loc1_.unselect();
         }
         else
         {
            _loc1_.select();
         }
      }
      
      private function onNameInputChange(param1:WindowEvent) : void
      {
         var _loc5_:* = null;
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.var_2652 == _loc2_.text)
         {
            return;
         }
         var _loc3_:String = _loc2_.text.toLowerCase();
         var _loc4_:* = [];
         for each(_loc5_ in this.var_234)
         {
            if(_loc5_.toLowerCase().search(_loc3_) != -1)
            {
               _loc4_.push(_loc5_);
            }
            if(_loc4_.length >= this.const_2260)
            {
               break;
            }
         }
         this.updateSuggestions(_loc4_);
         this.var_2652 = _loc2_.text;
      }
      
      private function onNameInputMouseDown(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         this.showSuggestions(false);
         if(this.var_1924)
         {
            _loc2_.text = "";
            this.var_1924 = false;
         }
      }
      
      private function onNameInputKeyUp(param1:WindowEvent) : void
      {
         var _loc2_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         switch(_loc2_.keyCode)
         {
            case Keyboard.UP:
               this.highlightSuggestion(this.var_375 - 1);
               break;
            case Keyboard.DOWN:
               this.highlightSuggestion(this.var_375 + 1);
               break;
            case Keyboard.ENTER:
               this.selectHighlighted();
               break;
            case Keyboard.TAB:
               this.focusMessageField();
         }
      }
      
      private function focusMessageField() : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc1_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         _loc1_.focus();
      }
      
      private function selectHighlighted() : void
      {
         if(this.var_265 == null || !this.var_265.visible)
         {
            return;
         }
         var _loc1_:IItemListWindow = this.var_265.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = _loc1_.getListItemAt(this.var_375) as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.findChildByName("name_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         this.setReceiverName(_loc3_.text);
         this.showSuggestions(false);
      }
      
      private function showSuggestions(param1:Boolean) : void
      {
         if(this.var_265 == null)
         {
            return;
         }
         this.var_265.visible = param1;
         if(!param1)
         {
            this.showMessageInput(true);
         }
      }
      
      private function showMessageInput(param1:Boolean) : void
      {
         var _loc2_:ITextFieldWindow = this._window.findChildByName("message_input") as ITextFieldWindow;
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      private function onMessageInputMouseDown(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this.var_1926)
         {
            _loc2_ = param1.target as ITextFieldWindow;
            if(_loc2_ != null)
            {
               _loc2_.text = "";
               this.var_1926 = false;
            }
         }
      }
      
      private function onMessageInputFocus(param1:WindowEvent) : void
      {
         this.showSuggestions(false);
      }
      
      private function onFreeWrappingSelected(param1:WindowEvent) : void
      {
         this.showSelectors(false);
      }
      
      private function onFreeWrappingUnSelect(param1:WindowEvent) : void
      {
         this.showSelectors(true);
      }
      
      private function showSelectors(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IWindowContainer = this._window.findChildByName("mask") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = !param1;
      }
      
      private function updateSuggestions(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_265 == null)
         {
            this.var_265 = this._window.findChildByName("suggestion_container") as IWindowContainer;
         }
         if(this.var_800 == null)
         {
            this.var_800 = this.createWindow("suggestion_list_item") as IWindowContainer;
         }
         if(this.var_265 == null || this.var_800 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = this.var_265.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.removeListItems();
         if(param1.length == 0)
         {
            this.showSuggestions(false);
            return;
         }
         this.showSuggestions(true);
         var _loc3_:int = 0;
         for each(_loc4_ in param1)
         {
            _loc5_ = this.var_800.clone() as IWindowContainer;
            if(_loc5_ != null)
            {
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onSuggestionsClick);
               _loc5_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onSuggestionsMouseOver);
               _loc6_ = _loc5_.findChildByName("name_text") as ITextWindow;
               if(_loc6_ != null)
               {
                  _loc6_.text = _loc4_;
                  _loc2_.addListItem(_loc5_);
               }
               _loc5_.color = this.getColor(_loc3_);
               _loc3_++;
            }
         }
         this.showMessageInput(param1.length < 2);
         this.highlightSuggestion(0);
      }
      
      private function onSuggestionsClick(param1:WindowEvent) : void
      {
         var _loc2_:IWindowContainer = param1.target as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:ITextWindow = _loc2_.findChildByName("name_text") as ITextWindow;
         if(_loc3_ == null)
         {
            return;
         }
         this.setReceiverName(_loc3_.text);
         this.showSuggestions(false);
      }
      
      private function onSuggestionsMouseOver(param1:WindowEvent) : void
      {
         var _loc2_:IWindowContainer = param1.target as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IItemListWindow = this.var_265.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc3_ == null)
         {
            return;
         }
         this.highlightSuggestion(_loc3_.getListItemIndex(_loc2_));
      }
      
      private function highlightSuggestion(param1:int) : void
      {
         var _loc3_:* = null;
         if(this.var_265 == null)
         {
            return;
         }
         var _loc2_:IItemListWindow = this.var_265.findChildByName("suggestion_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc3_ = _loc2_.getListItemAt(this.var_375) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = this.getColor(this.var_375);
         }
         this.var_375 = param1;
         if(this.var_375 < 0)
         {
            this.var_375 = _loc2_.numListItems - 1;
         }
         if(this.var_375 >= _loc2_.numListItems)
         {
            this.var_375 = 0;
         }
         _loc3_ = _loc2_.getListItemAt(this.var_375) as IWindowContainer;
         if(_loc3_ != null)
         {
            _loc3_.color = this.const_1541;
         }
      }
      
      private function getColor(param1:int) : uint
      {
         return param1 % 2 == 0 ? uint(this.const_2003) : uint(this.const_2004);
      }
      
      private function setReceiverName(param1:String) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:ITextFieldWindow = this._window.findChildByName("name_input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = param1;
         this.focusMessageField();
      }
      
      private function onColorItemClick(param1:WindowEvent) : void
      {
         this.var_1249 = param1.target.id;
         this.updateColorGrid();
         this.updatePreview();
      }
      
      private function updateColorGrid() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._window == null)
         {
            return;
         }
         var _loc1_:IItemGridWindow = this._window.findChildByName("color_grid") as IItemGridWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc4_) as IWindowContainer;
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.findChildByName("selection") as IBitmapWrapperWindow;
               if(_loc3_ != null)
               {
                  _loc3_.visible = _loc2_.id == this.var_1249;
               }
            }
            _loc4_++;
         }
      }
      
      public function receiverNotFound() : void
      {
         if(this.disposed)
         {
            return;
         }
         this.enableGiftButton(true);
         if(!this._catalog || !this._catalog.windowManager)
         {
            return;
         }
         this._catalog.windowManager.alert("${catalog.gift_wrapping.receiver_not_found.title}","${catalog.gift_wrapping.receiver_not_found.info}",0,this.alertHandler);
      }
      
      private function alertHandler(param1:IAlertDialog, param2:WindowEvent) : void
      {
         param1.dispose();
         this.enableGiftButton(true);
      }
      
      private function enableGiftButton(param1:Boolean) : void
      {
         if(this._window == null)
         {
            return;
         }
         var _loc2_:IButtonWindow = this._window.findChildByName("give_gift_button") as IButtonWindow;
         if(_loc2_ != null)
         {
            if(param1)
            {
               _loc2_.enable();
            }
            else
            {
               _loc2_.disable();
            }
         }
      }
      
      public function notEnoughCredits() : void
      {
         if(this.disposed)
         {
            return;
         }
         if(this._window == null)
         {
            return;
         }
         this.enableGiftButton(true);
         var _loc1_:ICheckBoxWindow = this._window.findChildByName("use_free_checkbox") as ICheckBoxWindow;
         if(_loc1_ != null)
         {
            _loc1_.select();
         }
      }
   }
}
