//
// Class for reading the LM35 Analog Temperature Sensor
//
// Original Arduino code by Ricardo Sequeira
//
// Port to Esquilo 20161219 Leeland Heins
//

class LM35
{
    adc = 0;

    constructor (_adc)
    {
        adc = ADC(_adc);

        adc.resolution(16);
    };
};

function LM35::read()
{
    local sensorValue;
    local temperature

    sensorValue = adc.read();
    temperature = (sensorValue * 0.48875855);

    return temperature;
}

function LM35::read_avg(times)
{
    local sum = 0;
    local i;
    local average;

    for (i = 0; i < times; i++) {
        sum += adc.read();
    }

    average = (sum * 0.48875855) / times;

    return average;
}

