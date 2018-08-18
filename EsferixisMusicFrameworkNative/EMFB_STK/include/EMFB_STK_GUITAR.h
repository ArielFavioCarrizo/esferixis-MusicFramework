#pragma once

#include "EMFB_STK_COMMON.h"

EMFB_STK_API void * emfb_stk_guitar_new(char **exception_desc, unsigned int nStrings, char *bodyfile);

EMFB_STK_API void emfb_stk_guitar_delete(void *guitar);

EMFB_STK_API void emfb_stk_guitar_clear(void *guitar);

EMFB_STK_API void emfb_stk_guitar_setLoopGain(void *guitar, double gain, int string);

EMFB_STK_API void emfb_stk_guitar_setPluckPosition(void *guitar, double position, int string);

EMFB_STK_API void emfb_stk_guitar_setFrequency(void *guitar, double frequency, unsigned int string);

EMFB_STK_API void emfb_stk_guitar_noteOn(void *guitar, double frequency, double amplitude, unsigned int string);

EMFB_STK_API void emfb_stk_guitar_noteOff(void *guitar, double amplitude, unsigned int string);

EMFB_STK_API void emfb_stk_guitar_tick(void *self, void *iFrames, void *oFrames, unsigned int iChannel, unsigned int oChannel);

EMFB_STK_API void emfb_stk_guitar_tickSub(void *self, void *iFrames, void *oFrames, unsigned int iOffset, unsigned int oOffset, unsigned int length, unsigned int iChannel, unsigned int oChannel);