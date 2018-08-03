// EsferixisMF_STK_Test.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "FileWvOut.h"
#include "Guitar.h"

#include <cmath>

using namespace stk;

float pitchToFrequency(float pitch) {
	return std::pow(2.0f, 1.0f / 12.0f * (pitch - 49.0f)) * 440.0f;
}

void guitarTest() {
	FileWvOut output("output.wav", 1, FileWrite::FILE_WAV, Stk::STK_SINT16);

	double time = 5;
	int nFrames = (long)(time * Stk::sampleRate());

	StkFrames inputFrames(nFrames, 1); // En cero

	StkFrames outputFrames(nFrames, 1);

	//output.openFile("output.wav", channels, FileWrite::FILE_WAV, Stk::STK_SINT16);

	Guitar guitar;

	guitar.clear();

	guitar.setLoopGain(0.99f);

	guitar.setPluckPosition(0.3f); // Para todas las cuerdas

	/*
	for (int i = 0; i < 6; i++) {
		guitar.noteOn(440.0f, 1.0f, i);
	}
	*/
	guitar.noteOn(pitchToFrequency(30.0f), 1.0f, 0);
	guitar.noteOn(pitchToFrequency(30.0f+7.0f), 1.0f, 1);

    guitar.tick(inputFrames, outputFrames, 0, 0);
	//guitar.tick(inputFrames, outputFrames, 1, 1);

	/*
	float mulValue = 1.0f / 6.0f;
	StkFrames mulFrames(mulValue, nFrames, channels);

	outputFrames *= mulFrames;
	*/
	
	output.tick(outputFrames);
}

int main()
{
	guitarTest();

    return 0;
}

