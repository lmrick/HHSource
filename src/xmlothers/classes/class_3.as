package
{
   import flash.utils.ByteArray;
   
   public class class_3
   {
       
      
      private var i:int = 0;
      
      private var var_2:int = 0;
      
      private var var_1:ByteArray;
      
      private const const_1:uint = 256;
      
      public function class_3(param1:ByteArray = null)
      {
         super();
         this.var_1 = new ByteArray();
       
         if(param1)
         {
            this.method_1(param1);
         }
      }
      
      public function method_7() : uint
      {
         return this.const_1;
      }
      
      public function method_1(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         _loc2_ = 0;
     
         while(_loc2_ < 256)
         {
            this.var_1[_loc2_] = _loc2_;
            _loc2_++;
         }
         _loc3_ = 0;
         _loc2_ = 0;
       
         while(_loc2_ < 256)
         {
            _loc3_ = _loc3_ + this.var_1[_loc2_] + param1[_loc2_ % param1.length] & 255;
            _loc4_ = int(this.var_1[_loc2_]);
            this.var_1[_loc2_] = this.var_1[_loc3_];
            this.var_1[_loc3_] = _loc4_;
            _loc2_++;
         }
         this.i = 0;
         this.var_2 = 0;
      }
      
      private function method_2() : uint
      {
         var _loc1_:int = 0;
         this.i = this.i + 1 & 255;
         this.var_2 = this.var_2 + this.var_1[this.i] & 255;
         _loc1_ = int(this.var_1[this.i]);
         this.var_1[this.i] = this.var_1[this.var_2];
         this.var_1[this.var_2] = _loc1_;
     
         return this.var_1[_loc1_ + this.var_1[this.i] & 255];
      }
      
      public function method_8() : uint
      {
         return 1;
      }
      
      public function method_3(param1:ByteArray) : void
      {
         var _loc2_:Number = 0;
     
         while(_loc2_ < param1.length)
         {
            var _loc3_:* = _loc2_++;
            param1[_loc3_] ^= this.method_2();
         }
      }
      
      public function method_5(param1:ByteArray) : void
      {
         this.method_3(param1);
      }
      
      public function method_6() : void
      {
         var _loc1_:Number = 0;
     
         if(this.var_1 != null)
         {
            _loc1_ = 0;
        
            while(_loc1_ < this.var_1.length)
            {
               this.var_1[_loc1_] = Math.random() * 256;
               _loc1_++;
            }
            this.var_1.length = 0;
            this.var_1 = null;
         }
         this.i = 0;
         this.var_2 = 0;
      }
   }
}
