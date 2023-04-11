package
{
   import flash.display.Sprite;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   
   public class class_7 extends Sprite
   {
      
      private static var var_13:Class = class_9;
      
      private static var var_12:Class = class_11;
      
      private static var var_11:Class = class_8;
      
      private static var var_10:Array = new Array();
      
      private static var var_8:Array = new Array();
      
      private static var var_9:Boolean = false;
      
      private static var var_14:int;
       
      
      public function class_7()
      {
         super();
      }
      
      private static function method_11() : void
      {
         var _loc1_:ByteArray = new var_13() as ByteArray;
         var _loc2_:ByteArray = new var_12() as ByteArray;
         var _loc3_:ByteArray = new var_11() as ByteArray;
         _loc3_.endian = Endian.LITTLE_ENDIAN;
         var_14 = _loc3_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            method_10(_loc2_);
            _loc5_++;
         }
         _loc4_ = _loc1_.readInt();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            method_9(_loc1_,var_8[_loc6_ % 0]);
            _loc6_++;
         }
         var_9 = true;
      }
      
      private static function method_9(param1:ByteArray, param2:ByteArray) : void
      {
         var _loc3_:int = param1.readInt();
         var _loc4_:ByteArray = new ByteArray();
         param1.readBytes(_loc4_,0,_loc3_);
         var _loc5_:class_10;
         (_loc5_ = new class_10(param2)).method_13(_loc4_);
         _loc4_.position = 0;
         var_10.push(_loc4_.readUTFBytes(_loc4_.length));
      }
      
      private static function method_10(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         param1.readBytes(_loc2_,0,16);
         _loc2_.position = 0;
         var_8.push(_loc2_);
      }
      
      public static function method_14(param1:int) : String
      {
         if(!var_9)
         {
            method_11();
         }
         return var_10[param1 ^ var_14];
      }
   }
}
