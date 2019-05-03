package tj.auto.springboot.utils;

import org.modelmapper.ModelMapper;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.entity.Generations;
import tj.auto.springboot.entity.Model;
import tj.auto.springboot.model.CarLargeDto;
import tj.auto.springboot.model.CarMinDTO;
import tj.auto.springboot.model.GenerationDTO;
import tj.auto.springboot.model.ModelDto;


public class ConvertorTDO {
    public static CarMinDTO carToCarMinTdo(ModelMapper modelMapper, Car car) {
        CarMinDTO carMinDTO = modelMapper.map(car, CarMinDTO.class);
        return carMinDTO;
    }
    public static CarLargeDto carToCarLargeDto(ModelMapper modelMapper, Car car) {
        CarLargeDto carLargeDto = modelMapper.map(car, CarLargeDto.class);
        return carLargeDto;
    }
    public static ModelDto modelTOmodelTdo(ModelMapper modelMapper, Model model) {
        ModelDto modelDto = modelMapper.map(model, ModelDto.class);
        return modelDto;
    }
    public static GenerationDTO  generationTogenerationDTO(ModelMapper modelMapper, Generations generations) {
        GenerationDTO generationDTO = modelMapper.map(generations, GenerationDTO.class);
        return generationDTO;
    }
}