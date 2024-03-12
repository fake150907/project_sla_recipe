package com.sla.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sla.project.repository.UploadedPhotoRepository;
import com.sla.project.vo.UploadedPhoto;

@Service
public class UploadedPhotoServiceImpl implements UploadedPhotoService {

	private final UploadedPhotoRepository uploadedPhotoRepository;

	@Autowired
	public UploadedPhotoServiceImpl(UploadedPhotoRepository uploadedPhotoRepository) {
		this.uploadedPhotoRepository = uploadedPhotoRepository;
	}

	@Override
	public List<UploadedPhoto> getAllUploadedPhotos() {
		return uploadedPhotoRepository.findAll();
	}

	@Override
	public void saveUploadedPhoto(UploadedPhoto uploadedPhoto) {
		uploadedPhotoRepository.save(uploadedPhoto);
	}
}