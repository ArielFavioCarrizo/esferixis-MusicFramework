#pragma once

#include "EMFB_STK_COMMON.h"

EMFB_STK_API void * emfb_stk_stkframes_new_zero(char **exception_desc, unsigned int nFrames, unsigned int nChannels);

EMFB_STK_API void * emfb_stk_stkframes_new_valued(char **exception_desc, double value, unsigned int nFrames, unsigned int nChannels);

EMFB_STK_API unsigned int emfb_stk_stkframes_channels(void *frames);

EMFB_STK_API unsigned int emfb_stk_stkframes_nFrames(void *frames);

EMFB_STK_API void * emfb_stk_stkframes_clone(char **exception_desc, void *frames);

EMFB_STK_API void emfb_stk_stkframes_addInplace(void *selfFrames, void *otherFrames);

EMFB_STK_API void emfb_stk_stkframes_mulHomologsInplace(void *selfFrames, void *otherFrames);

EMFB_STK_API void emfb_stk_stkframes_delete(void *frames);