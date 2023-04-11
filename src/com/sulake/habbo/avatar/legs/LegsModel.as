package com.sulake.habbo.avatar.legs
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.common.CategoryBaseModel;
   import com.sulake.habbo.avatar.common.class_3319;
   
   public class LegsModel extends CategoryBaseModel implements class_3319
   {
       
      
      public function LegsModel(param1:HabboAvatarEditor)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         super.init();
         initCategory("lg");
         initCategory("sh");
         initCategory("wa");
         var_1420 = true;
       
         if(!var_1430)
         {
            var_1430 = new LegsView(this);
          
            if(var_1430)
            {
               var_1430.init();
            }
         }
      }
   }
}
