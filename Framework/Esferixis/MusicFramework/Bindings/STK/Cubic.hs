{-# LANGUAGE MultiParamTypeClasses #-}

module Esferixis.MusicFramework.Bindings.STK.Cubic
   ( Cubic
   , newCubic
   , deleteCubic
   , cubicSetA1
   , cubicSetA2
   , cubicSetA3
   , cubicSetGain
   , cubicSetThreshold
   , cubicTickInplace
   , cubicTick
   , cubicTickSubInplace
   , cubicTickSub ) where

import Data.Word
import Data.Int

import Foreign.C
import Foreign.Ptr (Ptr, nullPtr, FunPtr)
import Foreign.C.String
import Foreign.ForeignPtr

import Control.Exception

import Esferixis.MusicFramework.Bindings.STK.Internal.Misc
import Esferixis.MusicFramework.Bindings.STK.Frames

import Esferixis.Foreign.Objects

data NativeCubic
type CubicPtr = Ptr NativeCubic

data Cubic = Cubic (ForeignPtr NativeCubic)
cubicForeignPtr (Cubic a) = a

exceptionSafeSelfAction = exceptionSafeStkObjectAction cubicForeignPtr

foreign import ccall "emfb_stk_cubic_new" c_emfb_stk_cubic_new :: Ptr ExceptDescPtr -> IO CubicPtr
foreign import ccall "&emfb_stk_cubic_delete" c_emfb_stk_cubic_delete_ptr :: FunPtr ( CubicPtr -> IO () )
foreign import ccall unsafe "emfb_stk_cubic_setA1" c_emfb_stk_cubic_setA1 :: CubicPtr -> CDouble -> IO ()
foreign import ccall unsafe "emfb_stk_cubic_setA2" c_emfb_stk_cubic_setA2 :: CubicPtr -> CDouble -> IO ()
foreign import ccall unsafe "emfb_stk_cubic_setA3" c_emfb_stk_cubic_setA3 :: CubicPtr -> CDouble -> IO ()
foreign import ccall unsafe "emfb_stk_cubic_setGain" c_emfb_stk_cubic_setGain :: CubicPtr -> CDouble -> IO ()
foreign import ccall unsafe "emfb_stk_cubic_setThreshold" c_emfb_stk_cubic_setThreshold :: CubicPtr -> CDouble -> IO ()
foreign import ccall "emfb_stk_cubic_tickInplace" c_emfb_stk_cubic_tickInplace :: CubicPtr -> StkFramesPtr -> CUInt -> IO ()
foreign import ccall "emfb_stk_cubic_tick" c_emfb_stk_cubic_tick :: CubicPtr -> StkFramesPtr -> StkFramesPtr -> CUInt -> CUInt -> IO ()
foreign import ccall "emfb_stk_cubic_tickSubInplace" c_emfb_stk_cubic_tickSubInplace :: CubicPtr -> StkFramesPtr -> CUInt -> CUInt -> CUInt -> IO ()
foreign import ccall "emfb_stk_cubic_tickSub" c_emfb_stk_cubic_tickSub :: CubicPtr -> StkFramesPtr -> StkFramesPtr -> CUInt -> CUInt -> CUInt -> CUInt -> CUInt -> IO ()

newCubic :: IO Cubic
newCubic = withCurriedStkExceptHandlingNewObject_partial (\foreignPtr -> Cubic foreignPtr) c_emfb_stk_cubic_delete_ptr c_emfb_stk_cubic_new id

deleteCubic :: Cubic -> IO ()
deleteCubic = deleteStkObject cubicForeignPtr

createSetCubicValue :: ( CubicPtr -> CDouble -> IO () ) -> ( Cubic -> Double -> IO () )
createSetCubicValue = setter exceptionSafeSelfAction

cubicSetA1 = createSetCubicValue c_emfb_stk_cubic_setA1
cubicSetA2 = createSetCubicValue c_emfb_stk_cubic_setA2
cubicSetA3 = createSetCubicValue c_emfb_stk_cubic_setA3
cubicSetGain = createSetCubicValue c_emfb_stk_cubic_setGain
cubicSetThreshold = createSetCubicValue c_emfb_stk_cubic_setThreshold

cubicTickInplace :: Cubic -> StkFrames -> Word32 -> IO ()
cubicTickInplace = createStkFramesTickInplaceFun exceptionSafeSelfAction c_emfb_stk_cubic_tickInplace

cubicTick :: Cubic -> StkFrames -> StkFrames -> Word32 -> Word32 -> IO ()
cubicTick = createStkFramesTickFun exceptionSafeSelfAction c_emfb_stk_cubic_tick

cubicTickSubInplace :: Cubic -> StkFrames -> Word32 -> Word32 -> Word32 -> IO ()
cubicTickSubInplace = createStkFramesTickSubInplaceFun exceptionSafeSelfAction c_emfb_stk_cubic_tickSubInplace

cubicTickSub :: Cubic -> StkFrames -> StkFrames -> Word32 -> Word32 -> Word32 -> Word32 -> Word32 -> IO ()
cubicTickSub = createStkFramesTickSubFun exceptionSafeSelfAction c_emfb_stk_cubic_tickSub
