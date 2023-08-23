package com.springboot.gga.service;

import com.springboot.gga.dto.BoardDto;
import com.springboot.gga.dto.FileDto;
import com.springboot.gga.dto.MovieDto;
import com.springboot.gga.dto.ProductDto;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

    /*****************
     * 영화 내용 등록시 필요한 멀티파일
     */

    /**
     * multiFileCheck = 멀티파일 저장 기능
     */
    /*filesave*/
    public void multiFileSave(MovieDto movieDto) throws IllegalStateException, IOException {
       /* String root_path = request.getSession().getServletContext().getRealPath("/");
        String attach_path = "\\resources\\upload\\";*/
        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\upload\\";

        int count = 0;
        for(MultipartFile file : movieDto.getFiles()) {
            if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
                File saveFile = new File(projectPath + movieDto.getGsfiles().get(count));
                file.transferTo(saveFile);
            }
            count++;
        }
    }

    /*filecheck*/
    public MovieDto multiFileCheck(MovieDto movieDto) {

        for(MultipartFile file : movieDto.getFiles()) {
            if(!file.getOriginalFilename().equals("")) {
                UUID uuid = UUID.randomUUID();
                movieDto.getGfiles().add(file.getOriginalFilename());
                movieDto.getGsfiles().add(uuid+"_"+file.getOriginalFilename());
            } else {
                movieDto.getGfiles().add("");
                movieDto.getGsfiles().add("");
            }
        }

        movieDto.setMainposter(movieDto.getGfiles().get(0));
        movieDto.setSmainposter(movieDto.getGsfiles().get(0));
        movieDto.setStillcut1(movieDto.getGfiles().get(1));
        movieDto.setSstillcut1(movieDto.getGsfiles().get(1));
        movieDto.setStillcut2(movieDto.getGfiles().get(2));
        movieDto.setSstillcut2(movieDto.getGsfiles().get(2));
        movieDto.setStillcut3(movieDto.getGfiles().get(3));
        movieDto.setSstillcut3(movieDto.getGsfiles().get(3));
        movieDto.setStillcut4(movieDto.getGfiles().get(4));
        movieDto.setSstillcut4(movieDto.getGsfiles().get(4));


        return movieDto;
    }

    public void multiFileDelete(ArrayList<String> oldGsFiles){
        String projectPath = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\upload\\";
        for (String fileName : oldGsFiles) {
            File deleteFile = new File(projectPath + fileName);
            if (deleteFile.exists()) {
                deleteFile.delete();
            }
        }
    }

}
