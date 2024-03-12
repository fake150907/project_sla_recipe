package com.sla.project.service;

import java.util.List;

import com.sla.project.vo.UploadedPhoto;

public interface UploadedPhotoService {
	List<UploadedPhoto> getAllUploadedPhotos();

	void saveUploadedPhoto(UploadedPhoto uploadedPhoto);
}