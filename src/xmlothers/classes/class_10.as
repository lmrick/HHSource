package
{
   import flash.utils.ByteArray;
   
   public class class_10
   {
       
      
      private var var_6:int = 0;
      
      private var var_7:int = 0;
      
      private var var_5:ByteArray;
      
      private const const_2:uint = 256;
      
      public function class_10(param1:ByteArray = null)
      {
         super();
         this.var_5 = new ByteArray();
         if(param1)
         {
            this.method_15(param1);
         }
      }
      
      public function method_17() : uint
      {
         return this.const_2;
      }
      
      public function method_15(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 256)
         {
            this.var_5[_loc2_] = _loc2_;
            _loc2_++;
         }
         _loc3_ = 0;
         _loc2_ = 0;
         while(_loc2_ < 256)
         {
            _loc3_ = _loc3_ + this.var_5[_loc2_] + param1[_loc2_ % param1.length] & 255;
            _loc4_ = int(this.var_5[_loc2_]);
            this.var_5[_loc2_] = this.var_5[_loc3_];
            this.var_5[_loc3_] = _loc4_;
            _loc2_++;
         }
         this.var_6 = 0;
         this.var_7 = 0;
      }
      
      private function method_16() : uint
      {
         var _loc1_:int = 0;
         this.var_6 = this.var_6 + 1 & 255;
         this.var_7 = this.var_7 + this.var_5[this.var_6] & 255;
         _loc1_ = int(this.var_5[this.var_6]);
         this.var_5[this.var_6] = this.var_5[this.var_7];
         this.var_5[this.var_7] = _loc1_;
         return this.var_5[_loc1_ + this.var_5[this.var_6] & 255];
      }
      
      public function method_19() : uint
      {
         return 1;
      }
      
      public function method_12(param1:ByteArray) : void
      {
         var _loc2_:Number = 0;
         while(_loc2_ < param1.length)
         {
            var _loc3_:* = _loc2_++;
            param1[_loc3_] ^= this.method_16();
         }
      }
      
      public function method_13(param1:ByteArray) : void
      {
         this.method_12(param1);
      }
      
      public function method_18() : void
      {
         var _loc1_:Number = 0;
         if(this.var_5 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_5.length)
            {
               this.var_5[_loc1_] = Math.random() * 256;
               _loc1_++;
            }
            this.var_5.length = 0;
            this.var_5 = null;
         }
         this.var_6 = 0;
         this.var_7 = 0;
      }
   }
}
