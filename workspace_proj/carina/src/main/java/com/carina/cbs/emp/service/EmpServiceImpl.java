package com.carina.cbs.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carina.cbs.emp.dao.IEmpDAO;
import com.carina.cbs.emp.vo.EmpVO;

@Service
public class EmpServiceImpl implements EmpService {

	@Autowired
	IEmpDAO empDAO;
	



    @Override
    public List<String> getAllCities() {
        return empDAO.getAllCities();
    }

    @Override
    public List<Integer> getAllYears() {
        return empDAO.getAllYears();
    }

    @Override
    public List<String> getAllMetros() {
        return empDAO.getAllMetros();
    }

    @Override
    public List<String> getCitiesByYearAndMetro(EmpVO empVO) {
        return empDAO.getCitiesByYearAndMetro(empVO);
    }

    @Override
    public List<String> getMonthByYearAndMetroAndCities(EmpVO empVO) {
        return empDAO.getMonthByYearAndMetroAndCities(empVO);
    }    
    
    @Override
    public List<String> getPowerUsageByYearAndMetroAndCities(EmpVO empVO) {
        return empDAO.getPowerUsageByYearAndMetroAndCities(empVO);
    }
    
    @Override
    public List<String> getPredictUsageByYearAndMetroAndCities(EmpVO empVO) {
        return empDAO.getPredictUsageByYearAndMetroAndCities(empVO);
    }    
    
    @Override
    public List<String> getPredictMonthByYearAndMetroAndCities(EmpVO empVO) {
        return empDAO.getPredictMonthByYearAndMetroAndCities(empVO);
    }
    @Override
    public Double getAverageYearAndMetroAndCities(EmpVO empVO) {
    	return empDAO.getAverageYearAndMetroAndCities(empVO);
    }
}
