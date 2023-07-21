package com.springboot.gga.controller;

import com.springboot.gga.dto.PageDto;
import com.springboot.gga.dto.ProductDto;
import com.springboot.gga.dto.SessionDto;
import com.springboot.gga.service.CartService;
import com.springboot.gga.service.FileService;
import com.springboot.gga.service.PageService;
import com.springboot.gga.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Slf4j
public class ProductController {

    @Autowired
    private ProductService productService;
    @Autowired
    private PageService pageService;
    @Autowired
    private FileService fileUploadService;
    @Autowired
    private CartService cartService;

    /**
     * admin store page controller
     */
    @PostMapping("admin_product_delete")
    public String admin_product_delete(ProductDto productDto) throws Exception {
        String oldgsfile = productDto.getGsfile();
        if (productService.delete(productDto.getPid()) == 1) {
            if (!oldgsfile.equals("")) fileUploadService.fileDelete(oldgsfile);
        };
        return "redirect:/admin_product_list/" + productDto.getPage();
    }
    @PostMapping("admin_product_update")
    public String admin_product_update(ProductDto productDto) throws Exception {
        String oldgsfile = productDto.getGsfile();
        productDto = (ProductDto) fileUploadService.fileCheck(productDto);
        if (productService.update(productDto) == 1) {
            if (!productDto.getFile1().isEmpty()) {
                fileUploadService.fileSave(productDto);
                fileUploadService.fileDelete(oldgsfile);
            }
        }

        return "redirect:/admin_product_content/"+productDto.getPid()+"/"+productDto.getPage();
    }
    @GetMapping("admin_product_update/{pid}/{page}")
    public String admin_product_update(@PathVariable String pid,
                                       @PathVariable String page,
                                       Model model) {
        ProductDto productDto = productService.content(pid);
        model.addAttribute("product", productDto);
        model.addAttribute("page", page);
        return "admin/product/admin_product_update";
    }

    @GetMapping("admin_product_content/{pid}/{page}")
    public String admin_product_content(@PathVariable String pid,
                                        @PathVariable String page,
                                        Model model){
        ProductDto productDto = productService.content(pid);
        model.addAttribute("product", productDto);
        model.addAttribute("page", page);
        return "admin/product/admin_product_content";
    }

    @PostMapping("admin_product_register")
    public String admin_product_register(ProductDto productDto) throws Exception {
        productDto = (ProductDto) fileUploadService.fileCheck(productDto);
        if (productService.insert(productDto) == 1) fileUploadService.fileSave(productDto);
        return "redirect:/admin_product_list/1";
    }

    @GetMapping("admin_product_register")
    public String admin_product_register(){
        return "admin/product/admin_product_register";
    }

    @GetMapping("admin_product_list/{page}")
    public String admin_product_list(@PathVariable String page, Model model) {
        PageDto pageDto = pageService.getPaging(new PageDto(page, "product"));
        model.addAttribute("list", productService.list(pageDto));
        model.addAttribute("page", pageDto);
        return "admin/product/admin_product_list";
    }


    /**
     * store page controller
     */
    @GetMapping("store/combo")
    public String combo(Model model, HttpSession session){
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        if (svo != null) {
            int count = cartService.count(svo.getId());
            model.addAttribute("count", count);
        }

        String pcategory = "combo(콤보)";
        List<ProductDto> list = productService.categoryList(pcategory);

        model.addAttribute("list", list);
        return "store/combo";
    }

    @GetMapping("store/popcorn")
    public String popcorn(Model model, HttpSession session){
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        if (svo != null) {
            int count = cartService.count(svo.getId());
            model.addAttribute("count", count);
        }
        String pcategory = "popcorn(팝콘)";
        List<ProductDto> list = productService.categoryList(pcategory);
        model.addAttribute("list", list);
        return "store/popcorn";
    }

    @GetMapping("store/beverage")
    public String beverage(Model model, HttpSession session){
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        if (svo != null) {
            int count = cartService.count(svo.getId());
            model.addAttribute("count", count);
        }
        String pcategory = "beverage(음료)";
        List<ProductDto> list = productService.categoryList(pcategory);
        model.addAttribute("list", list);
        return "store/beverage";
    }

    @GetMapping("store/card")
    public String card(Model model, HttpSession session){
        SessionDto svo = (SessionDto) session.getAttribute("svo");
        if (svo != null) {
            int count = cartService.count(svo.getId());
            model.addAttribute("count", count);
        }
        String pcategory = "card(상품권)";
        List<ProductDto> list = productService.categoryList(pcategory);
        model.addAttribute("list", list);
        return "store/card";
    }
}
