/**
 * @title	: 파일처리 관련 공통 유틸
 * @package	: kr.co.nextlab.util
 * @file	: FileUtil.java
 * @desc	: 
 */
package kr.co.nextlab.util;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FileUtil {
	
    public static final int BUFFER_SIZE = 4096;
    public static final String SELF_DIRECTORY = ".";
    public static final String PARENT_DIRECTORY = "..";
    public static final char SYSTEM_FILE_SEPERATOR = File.separatorChar;
    public static final char PUBLIC_FILE_SEPERATOR = '/';
    public static Character[] invalidFileParameters = {'\\', '/', ':', '*', '?', '"', '<', '>', '|'};
    public static String[] invalidFileReplaceStrings = {"_A", "_B", "_C", "_D", "_E", "_F", "_G", "_H", "_I"};
    public static Map<Character, String> invalidFileCharMap = new HashMap<Character, String>();
    static {
        for (int i = 0; i < invalidFileParameters.length; i++) {
            invalidFileCharMap.put(invalidFileParameters[i], invalidFileReplaceStrings[i]);
        }
    }

    /**
     * source FilePath -> Dest FilePath
     * @param source
     * @param dest
     * @throws IOException
     */
    public static void copy(String source, String dest) throws IOException {
        InputStream  inputStream = null;
        OutputStream outputStream = null;
        File fs = new File(source);
        File fd = new File(dest);

        try {
            inputStream  = new FileInputStream(fs);
            outputStream = new FileOutputStream(fd);
            copy(inputStream, outputStream);
        } finally {
            CloserUtil.close(new Object[] {inputStream, outputStream});
        }
    }

    /**
     * InputStream -> File
     * @param is
     * @param file
     */
    public static void copy(InputStream is, File file) {
        OutputStream outputStream = null;

        try {
            mkDir(file.getParent());
            outputStream = new FileOutputStream(file);
            copy(is, outputStream);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            CloserUtil.close(outputStream);
        }
    }

    /**
     * InputStream -> FilePath
     * @param is
     * @param file
     */
    public static void copy(InputStream is, String filePath) {
        copy(is, new File(filePath));
    }

    /**
     * inputStream -> outputStream
     * @param inputStream
     * @param outputStream
     */
    public static void copy(InputStream inputStream, OutputStream outputStream) {
        try {
            byte[] bytes = new byte[BUFFER_SIZE];
            int readByte = 0;
            while ((readByte = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, readByte);
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * byte[] -> file
     * @param source
     * @param dest
     * @throws IOException
     */
    public static void copy(byte[] source, String dest) {
        InputStream  inputStream = null;
        OutputStream outputStream = null;
        File fs = new File(dest);

        try {
            inputStream  = new ByteArrayInputStream(source);
            copy(inputStream, fs);
        } finally {
            CloserUtil.close(new Object[] {inputStream, outputStream});
        }
    }

    /**
     * 디랙토리 생성하기
     * @param dir
     */
    public static void mkDir(String dir) {
        File f = new File(dir);
        if (f.exists()) {
        } else {
            if (f.mkdirs() == false) {
                throw new RuntimeException("[" + dir + "] Can Not Create");
            }
        }
    }

    /**
     * 디랙토리 목록을 가져온다.
     * @param path
     * @return
     */
    public static List<File> getDirectorys(String path) {
        File dir = new File(path);
        if (dir.isDirectory() == false) {
            return null;
        }

        String[] directoryNames = dir.list();
        List<File> list = new ArrayList<File>();
        for (int i = 0; i < directoryNames.length; i++) {
            File f = new File(path + File.separator + directoryNames[i]);
            if (f.isDirectory()) {
                list.add(f);
            }
        }
        return list;
    }

    /**
     * @param fileName
     * @return
     */
    public static String getValidFileName(String fileName) {
        StringBuilder buffer = new StringBuilder(fileName.length());
        for (Character ch : fileName.toCharArray()) {
            if (invalidFileCharMap.containsKey(ch)) {
                buffer.append(invalidFileCharMap.get(ch));
            } else {
                buffer.append(ch);
            }
        }

        return buffer.toString();
    }

    /**
     * @param f
     * @param charset
     * @return
     */
    public static String getTextFileBody(File f, String charset) {
        StringWriter sw = new StringWriter();
        BufferedReader reader = null;
        char[] buffer = new char[BUFFER_SIZE];
        String result = null;
        try {
            int readCount = 0;
            reader = new BufferedReader(new InputStreamReader(new FileInputStream(f), charset));
            while ((readCount = reader.read(buffer)) != -1) {
                sw.write(buffer, 0, readCount);
            }
            sw.flush();
            result = sw.getBuffer().toString();
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            CloserUtil.close(new Object[] {sw, reader});
        }

        return result;
    }
    
    /**
     * 파일명의 해쉬코드로 폴더명 생성
     * @param fileName
     * @return
     */
    public static String getHashCodeDirectory(String fileName) {
        String hashCodeDirectory = new Integer((Math.abs(fileName.hashCode() % 1000)) + 1000).toString();
        return hashCodeDirectory;
    }

    /**
     * 파일 이름 앞에 현재 시간을 붙여준다.
     * @param fileName
     * @return
     */
    public static String getFileNameAddTime(String fileName) {
        return Long.toString(System.currentTimeMillis()) + "_" + fileName;
    }
    
}
