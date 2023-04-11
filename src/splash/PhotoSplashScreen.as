package splash
{
   import flash.display.Bitmap;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   
   public class PhotoSplashScreen extends Sprite
   {
      private var splashBgClass:Class;
      
      private var splashTopClass:Class;
      
      private var splashImg1:Class;
      
      private var splashImg2:Class;
      
      private var splashImg3:Class;
      
      private var splashImg4:Class;
      
      private var splashImg5:Class;
      
      private var splashImg6:Class;
      
      private var splashImg7:Class;
      
      private var splashImg8:Class;
      
      private var splashImg9:Class;
      
      private var splashImg10:Class;
      
      private var splashImg11:Class;
      
      private var splashImg12:Class;
      
      private var splashImg13:Class;
      
      private var splashImg14:Class;
      
      private var splashImg15:Class;
      
      private var splashImg16:Class;
      
      private var splashImg17:Class;
      
      private var splashImg18:Class;
      
      private var splashImg19:Class;
      
      private var splashImg20:Class;
      
      private var splashImg21:Class;
      
      private var splashImg22:Class;
      
      private var splashImg23:Class;
      
      private var splashImg24:Class;
      
      private var splashImg25:Class;
      
      private var splashImg26:Class;
      
      private var splashImg27:Class;
      
      private var splashImg28:Class;
      
      private var splashImg29:Class;
      
      private var splashImg30:Class;
      
      public function PhotoSplashScreen(param1:DisplayObjectContainer)
      {
         var _loc3_:Bitmap = null;
        
         splashBgClass = class_87;
         splashTopClass = class_88;
         splashImg1 = class_99;
         splashImg2 = class_110;
         splashImg3 = class_112;
         splashImg4 = class_113;
         splashImg5 = class_114;
         splashImg6 = class_115;
         splashImg7 = class_116;
         splashImg8 = class_117;
         splashImg9 = class_118;
         splashImg10 = class_89;
         splashImg11 = class_90;
         splashImg12 = class_91;
         splashImg13 = class_92;
         splashImg14 = class_93;
         splashImg15 = class_94;
         splashImg16 = class_95;
         splashImg17 = class_96;
         splashImg18 = class_97;
         splashImg19 = class_98;
         splashImg20 = class_100;
         splashImg21 = class_101;
         splashImg22 = class_102;
         splashImg23 = class_103;
         splashImg24 = class_104;
         splashImg25 = class_105;
         splashImg26 = class_106;
         splashImg27 = class_107;
         splashImg28 = class_108;
         splashImg29 = class_109;
         splashImg30 = class_111;
         super();
      
         var _loc2_:Vector.<Bitmap> = new Vector.<Bitmap>(0);
         _loc3_ = new splashBgClass() as Bitmap;
         _loc2_.push(_loc3_);
    
         var _loc4_:Class;    
        
         if((_loc4_ = this["splashImg" + (int(1 + Math.floor(Math.random() * 30)))] as Class) != null)
         {
            _loc3_ = new _loc4_();
            _loc3_.x = 96;
            _loc3_.y = 51;
            _loc2_.push(_loc3_);
         }
      
         _loc3_ = new splashTopClass() as Bitmap;
         _loc2_.push(_loc3_);
       
         for each(_loc3_ in _loc2_)
         {
            addChild(_loc3_);
         }
      }
   }
}
