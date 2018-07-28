module Esferixis.MusicFramework.Backend.STK.Internal.Frames where

import Esferixis.MusicFramework.Backend.STK.Internal.Misc

import Foreign.C
import Foreign.Ptr (Ptr, nullPtr)

data NativeFrames
type FramesPtr = Ptr NativeFrames

foreign import ccall "emfb_stk_frames_new_zero" c_emfb_stk_frames_new_zero :: Ptr ExceptDescPtr -> CInt -> CInt -> IO FramesPtr
foreign import ccall "emfb_stk_frames_new_valued" c_emfb_stk_frames_new_valued :: Ptr ExceptDescPtr -> CFloat -> CInt -> CInt -> IO FramesPtr
foreign import ccall "emfb_stk_frames_channels" c_emfb_stk_frames_channels :: Ptr ExceptDescPtr -> FramesPtr -> IO CInt
foreign import ccall "emfb_stk_frames_delete" c_emfb_stk_frames_delete :: Ptr ExceptDescPtr -> FramesPtr -> IO ()
