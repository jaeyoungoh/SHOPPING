package com.kitri.shopping.product;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Resource(name="productService")
	private ProductService service;
	
	
	@RequestMapping(value="/product/list.do")
	public ModelAndView product_list(){
		ModelAndView mav=new ModelAndView("/product/list");
		List<Product> list=service.getAllProduct();
		mav.addObject("list", list);
		mav.addObject("msg", "user");
		return mav;
	}
	@RequestMapping(value="/product/slist.do")
	public ModelAndView product_slist(HttpServletRequest request){
		ModelAndView mav=new ModelAndView("/product/list");
		String users_id=(String) request.getSession().getAttribute("user_id");
		List<Product> list=service.getProductbyUser(users_id);
		mav.addObject("list", list);
		mav.addObject("msg", "s");
		return mav;
	}
	
	@RequestMapping(value="/product/view.do")
	public ModelAndView product_view(@RequestParam(value="product_id")int product_id){
		ModelAndView mav=new ModelAndView("/product/view");
		Product product=service.getProduct(product_id);
		mav.addObject("product", product);
		return mav;
	}
	
	@RequestMapping(value="/product/category.do")
	public ModelAndView product_list(@RequestParam(value="category") String category){
		ModelAndView mav=new ModelAndView("/product/list");
		List<Product> list=service.getProductbyCategory(category);
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping(value="/product/addForm.do")
	public String addForm(Model m){
		m.addAttribute("msg", "add");
		return "/product/addForm";
	}
	@RequestMapping(value="/product/editStatus.do")
	public String del(@RequestParam(value="product_id")int product_id,@RequestParam(value="status")String status){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("status", status);
		service.editStatus(map);
		return "redirect:/product/list.do";
	}
	///
	@RequestMapping(value="/product/editForm.do")
	public String editForm(@RequestParam(value="product_id")int product_id,Model m){
		Product p=service.getProduct(product_id);
		m.addAttribute("product",p);
		m.addAttribute("msg", "edit");
		return "/product/addForm";
	}
	@RequestMapping(value="/product/add.do")
	public String add_product(Product product,HttpServletRequest request,@RequestParam(value="img_url1") MultipartFile file){
		System.out.println(product);
		String writer=product.getUser_id();
		String filename= file.getOriginalFilename();
		String filename1="";
		if(!filename.equals("")){
		String path=request.getSession().getServletContext().getRealPath("/")+"img/"+writer+"_"+filename;
		filename1=writer+"_"+filename;
				File f=new File(path);
				System.out.println(path);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			filename1=" ";
		}
		product.setImg_url(filename1);
		service.addProduct(product);
		return "redirect:/product/slist.do";
	}
	@RequestMapping(value="/product/edit.do")
	public String edit_product(Product product,HttpServletRequest request,@RequestParam(value="img_url1") MultipartFile file){
		System.out.println(product);
		String writer=product.getUser_id();
		String filename= file.getOriginalFilename();
		String filename1="";
		if(!filename.equals("")){
		String path=request.getSession().getServletContext().getRealPath("/")+"img/"+writer+"_"+filename;
		filename1=writer+"_"+filename;
				File f=new File(path);
				System.out.println(path);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			filename1=" ";
		}
		product.setImg_url(filename1);
		service.addProduct(product);
		return "redirect:/product/slist.do";
	}
	
	
		@RequestMapping(value="/product/dels.do")
		public String dels(@RequestParam(value="product_id")String product_ids){
			String arr[]=product_ids.split(",");
			for(int i=0;i<arr.length;i++){
				service.delProduct(Integer.parseInt(arr[i]));
			}
			return "redirect:/product/slist.do";
		}
	//단일파일업로드
	@RequestMapping(value="/photoUpload", method = {RequestMethod.GET, RequestMethod.POST})
	public String photoUpload(HttpServletRequest request, PhotoVo vo){
	    String callback = vo.getCallback();
	    String callback_func = vo.getCallback_func();
	    String file_result = "";
	    try {
	        if(vo.getFiledata() != null && vo.getFiledata().getOriginalFilename() != null && !vo.getFiledata().getOriginalFilename().equals("")){
	            //파일이 존재하면
	            String original_name = vo.getFiledata().getOriginalFilename();
	            String ext = original_name.substring(original_name.lastIndexOf(".")+1);
	            //파일 기본경로
	            String defaultPath = request.getSession().getServletContext().getRealPath("/");
	            System.out.println(defaultPath+"실제경로");
	            //파일 기본경로 _ 상세경로
	            String path = defaultPath + "img" + File.separator;              
	            File file = new File(path);
	            System.out.println("path:"+path);
	            //디렉토리 존재하지 않을경우 디렉토리 생성
	            if(!file.exists()) {
	                file.mkdirs();
	            }
	            //서버에 업로드 할 파일명(한글문제로 인해 원본파일은 올리지 않는것이 좋음)
	            String realname = UUID.randomUUID().toString() + "." + ext;
	        ///////////////// 서버에 파일쓰기 ///////////////// 
	            vo.getFiledata().transferTo(new File(path+realname));
	            file_result += "&bNewLine=true&sFileName="+original_name+"&sFileURL=/resource/photo_upload/"+realname;
	        } else {
	            file_result += "&errstr=error";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return "redirect:" + callback + "?callback_func="+callback_func+file_result;
	}
	
	//다중파일업로드
	@RequestMapping(value="/multiplePhotoUpload", method = {RequestMethod.GET, RequestMethod.POST})
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "img" + File.separator ;
	         File file = new File(filePath);
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	         if(is != null) {
	            is.close();
	         }
	         os.flush();
	         os.close();
	         ///////////////// 서버에 파일쓰기 /////////////////
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+request.getContextPath()+"/img/"+realFileNm;
	         PrintWriter print = response.getWriter();
	         print.print(sFileInfo);
	         print.flush();
	         print.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
}
