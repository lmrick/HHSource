package com.hurlant.math
{
   internal class BarrettReduction implements IReduction
   {
       
      
      private var m:com.hurlant.math.BigInteger;
      
      private var r2:com.hurlant.math.BigInteger;
      
      private var q3:com.hurlant.math.BigInteger;
      
      private var var_1024:com.hurlant.math.BigInteger;
      
      public function BarrettReduction(param1:com.hurlant.math.BigInteger)
      {
         super();
         r2 = new com.hurlant.math.BigInteger();
         q3 = new com.hurlant.math.BigInteger();
         com.hurlant.math.BigInteger.const_3.bi_internal::dlShiftTo(2 * param1.t,r2);
         var_1024 = r2.divide(param1);
         this.m = param1;
      }
      
      public function revert(param1:com.hurlant.math.BigInteger) : com.hurlant.math.BigInteger
      {
         return param1;
      }
      
      public function mulTo(param1:com.hurlant.math.BigInteger, param2:com.hurlant.math.BigInteger, param3:com.hurlant.math.BigInteger) : void
      {
         param1.bi_internal::multiplyTo(param2,param3);
         reduce(param3);
      }
      
      public function sqrTo(param1:com.hurlant.math.BigInteger, param2:com.hurlant.math.BigInteger) : void
      {
         param1.bi_internal::squareTo(param2);
         reduce(param2);
      }
      
      public function convert(param1:com.hurlant.math.BigInteger) : com.hurlant.math.BigInteger
      {
         var _loc2_:com.hurlant.math.BigInteger = null;
         if(param1.bi_internal::s < 0 || param1.t > 0)
         {
            return param1.mod(m);
         }
         if(param1.compareTo(m) < 0)
         {
            return param1;
         }
         _loc2_ = new com.hurlant.math.BigInteger();
         param1.bi_internal::copyTo(_loc2_);
         reduce(_loc2_);
         return _loc2_;
      }
      
      public function reduce(param1:com.hurlant.math.BigInteger) : void
      {
         var _loc2_:com.hurlant.math.BigInteger = param1 as com.hurlant.math.BigInteger;
         _loc2_.bi_internal::drShiftTo(-1,r2);
         if(_loc2_.t > NaN)
         {
            _loc2_.t = NaN;
            _loc2_.bi_internal::clamp();
         }
         var_1024.bi_internal::multiplyUpperTo(r2,NaN,q3);
         m.bi_internal::multiplyLowerTo(q3,NaN,r2);
         while(_loc2_.compareTo(r2) < 0)
         {
            _loc2_.bi_internal::dAddOffset(1,NaN);
         }
         _loc2_.bi_internal::subTo(r2,_loc2_);
         while(_loc2_.compareTo(m) >= 0)
         {
            _loc2_.bi_internal::subTo(m,_loc2_);
         }
      }
   }
}
