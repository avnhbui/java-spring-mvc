package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService,
            UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getDashBoard(Model model) {
        List<Product> products = this.productService.GetAllProduct();
        model.addAttribute("products", products);
        return "admin/product/view";
    }

    @RequestMapping("/admin/product/{id}")
    public String GetProductDetailPage(Model model, @PathVariable long id) {
        Product productWithId = this.productService.GetProductID(id);
        model.addAttribute("productWithId", productWithId);
        System.out.println(id);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/create") // GET
    public String AdminProductCreate(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @RequestMapping("/admin/product/delete/{id}")
    public String AdminProductDelete(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postProductDelete(Model model, @ModelAttribute("deleteProduct") Product spham) {
        this.productService.DeleteProduct(spham.getId());
        return "redirect:/admin/product";
    }

    @RequestMapping("/admin/product/update/{id}")
    public String AdminProductUpdate(Model model, @PathVariable long id) {
        Product sphamUpdate = this.productService.GetProductID(id);
        model.addAttribute("updateProduct", sphamUpdate);
        System.out.println(id);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postProductUpdate(@ModelAttribute("updateProduct") @Valid Product spham,
            BindingResult newProductBindingResult,
            @RequestParam("vanhbuiFile") MultipartFile file) {
        // validatw
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        Product sphamUpdate = this.productService.GetProductID(spham.getId());
        if (!file.isEmpty()) {
            String img = this.uploadService.handleSaveUploadFile(file, "product");
            sphamUpdate.setImage(img);
        }
        sphamUpdate.setName(spham.getName());
        sphamUpdate.setPrice(spham.getPrice());
        sphamUpdate.setDetailDesc(spham.getDetailDesc());
        sphamUpdate.setShortDesc(spham.getShortDesc());
        sphamUpdate.setQuantity(spham.getQuantity());
        sphamUpdate.setFactory(spham.getFactory());
        sphamUpdate.setTarget(spham.getTarget());
        this.productService.handleSaveProduct(sphamUpdate);
        return "redirect:/admin/product";
    }

    @PostMapping(value = "/admin/product/create")
    public String CreateProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product spham,
            BindingResult newProductBindingResult,
            @RequestParam("vanhbuiFile") MultipartFile file) {
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        } // validate
        if (newProductBindingResult.hasErrors()) {
            return "/admin/product/create";
        }
        String avatar = this.uploadService.handleSaveUploadFile(file, "product");
        spham.setImage(avatar);
        this.productService.handleSaveProduct(spham);
        return "redirect:/admin/product";
    }
}
