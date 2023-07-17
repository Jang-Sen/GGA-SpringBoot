package com.springboot.gga.service;

import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.FileDto;
import com.springboot.gga.dto.ProductDto;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.UUID;

@Service
public class FileService {
    /**
     * fileDelete 기능 - 파일 삭제
     */
    public void fileDelete(String oldFile) throws Exception{
        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\upload\\";
        File deleteFile = new File(projectPath + oldFile);

        if (deleteFile.exists()) deleteFile.delete();
    }

    /**
     * fileSave 기능 - 파일이 존재하면 서버에 저장하는 메소드
     */
    public void fileSave(FileDto fileDto) throws Exception{
       /* BoardDto boardDto = null;
        ProductDto productDto = null;

        if (fileDtoName.equals("board")){
            boardDto = (BoardDto) fileDtoect;
        } else if (fileDtoName.equals("product")) {
            productDto = (ProductDto) fileDtoect;
        }*/
        //파일의 저장위치
        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\upload\\";

        //파일이 존재하면 서버에 저장
        if(fileDto.getFile1().getOriginalFilename() != null
                && !fileDto.getFile1().getOriginalFilename().equals("")) {
            File saveFile = new File(projectPath + fileDto.getGsfile());
            fileDto.getFile1().transferTo(saveFile);
        }
    }


    /**
     * fileCheck 기능 - 파일이 존재하면  boardVo에 gfile, gsfile set!, 없으면 boardVo 리턴!
     */
    public FileDto fileCheck(FileDto fileDto) {
        System.out.println("name---> " + fileDto.getFile1().getOriginalFilename());
        if(fileDto.getFile1().getOriginalFilename() != null
                && !fileDto.getFile1().getOriginalFilename().equals("")) {  //파일이 존재하면

            //gsfile 파일 중복 처리
            UUID uuid = UUID.randomUUID();
            String gfile = fileDto.getFile1().getOriginalFilename();
            String gsfile = uuid + "_" + gfile;

            fileDto.setGfile(gfile);
            fileDto.setGsfile(gsfile);
        }else {
            System.out.println("파일 없음");
            //boardVo.setgfile("");
            //boardVo.setgsfile("");
        }

        return fileDto;
    }
}
