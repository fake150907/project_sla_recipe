package com.sla.project.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.sla.project.vo.UploadedPhoto;

@Mapper
public interface UploadedPhotoRepository {

	List<UploadedPhoto> findAll();

	void save(UploadedPhoto uploadedPhoto);

}