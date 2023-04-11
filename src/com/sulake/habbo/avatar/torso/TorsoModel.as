package com.sulake.habbo.avatar.torso
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.class_3319;
   
   public class TorsoModel extends CategoryBaseModel implements class_3319
   {
       
      
      public function TorsoModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory("cc");
         initCategory("ch");
         initCategory("ca");
         initCategory("cp");
         var_1420 = true;
         if(!var_1430)
         {
            var_1430 = new TorsoView(this);
            if(var_1430)
            {
               var_1430.init();
            }
         }
      }
   }
}
