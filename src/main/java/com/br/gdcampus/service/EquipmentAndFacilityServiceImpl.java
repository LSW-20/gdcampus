package com.br.gdcampus.service;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.EquipmentAndFacilityDao;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class EquipmentAndFacilityServiceImpl implements EquipmentAndFacilityService {

	private final EquipmentAndFacilityDao equipAndFacilityDao;
	
}
