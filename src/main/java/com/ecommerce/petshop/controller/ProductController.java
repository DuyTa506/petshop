package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.dto.request.ProductRequest;
import com.ecommerce.petshop.dto.request.RatingRequest;
import com.ecommerce.petshop.dto.request.SearchProductDTO;
import com.ecommerce.petshop.dto.response.POIImageUpdateDTO;
import com.ecommerce.petshop.repository.ProductImageRepository;
import com.ecommerce.petshop.repository.ProductRepository;
import com.ecommerce.petshop.service.interfaces.ProductService;
import com.ecommerce.petshop.util.GoogleDriveManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    GoogleDriveManager driveManager;
    @Autowired
    private ProductService service;

    @Autowired
    private ProductImageRepository imgRepository;

    @GetMapping
    public ResponseEntity getProducts(@RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false, defaultValue = "10") int size) {
        return ResponseEntity.ok(service.getProduct(size, page).toList());
    }

    //    @GetMapping("/search")
//    public ResponseEntity searchProducts(@RequestParam int page, @RequestParam int size,@RequestParam String key){
//        return ResponseEntity.ok(service.getProductByKeyword(size,page, key));
//    }
    @GetMapping("/filter/category")
    public ResponseEntity filterProductsByCategory(@RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false, defaultValue = "10") int size, @RequestParam int category) {
        return ResponseEntity.ok(service.filterByCategory(size, page, category));
    }

    @GetMapping("/filter/brand")
    public ResponseEntity filterProductsByBrand(@RequestParam int page, @RequestParam int size, @RequestParam int brand) {
        return ResponseEntity.ok(service.filterByBrand(size, page, brand));
    }

    @PostMapping("/insert")
    public ResponseEntity insertProduct(@RequestBody ProductRequest product) {
        return ResponseEntity.ok(service.insertProduct(product));
    }

    @DeleteMapping("/delete")
    public ResponseEntity deleteProduct(@RequestHeader int id) {
        return ResponseEntity.ok(service.deleteProduct(id));
    }

    @GetMapping("/get/{id}")
    public ResponseEntity getProduct(@PathVariable int id) {
        return ResponseEntity.ok(service.getProduct(id));
    }

    @PostMapping("/update")
    public ResponseEntity updateProduct(@RequestBody ProductRequest product) {
        return ResponseEntity.ok(service.updateProduct(product));
    }

    @GetMapping("/get-reviews")
    public ResponseEntity getReviews(@RequestParam int id) {
        return ResponseEntity.ok(service.getproductsReviews(id));
    }

    @PostMapping("/search")
    public ResponseEntity search(@RequestBody SearchProductDTO searchProduct) {
        return ResponseEntity.ok(service.search(searchProduct));
    }

    @PostMapping("/uploadImg")
    @ResponseBody
    public ResponseEntity<String> uploadImg(@RequestPart("File") MultipartFile file) {
        try {
            String webViewLink = null;
            try {
                webViewLink = driveManager.uploadFile(file, "petShop/img/product");
            } catch (Exception e) {
                throw new RuntimeException("Could not store the file. Error: " + e.getMessage());
            } finally {

            }
            return new ResponseEntity<>(webViewLink, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @GetMapping("/getAll")
    public ResponseEntity getAll() {
        return new ResponseEntity<>(service.getAll(), HttpStatus.OK);
    }

    @PostMapping("/addImg/{pId}/{description}")
    @ResponseBody
    public ResponseEntity<?> addImage(@PathVariable long pId, @PathVariable String description, @RequestPart("File") MultipartFile file) throws Exception {
//        try{
        String webViewLink = driveManager.uploadFile(file, "petShop/img/product");
        if (description.equals("*"))
            imgRepository.addImage(pId, null, webViewLink);
        else
            imgRepository.addImage(pId, description, webViewLink);
        return new ResponseEntity<>(HttpStatus.OK);
//        } catch (Exception e){
//            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//        }
    }

    @RequestMapping(value = "/deleteImg/{imgId}", produces = {"*/*"}, method = RequestMethod.POST)
    public ResponseEntity<?> deleteImg(@PathVariable long imgId) {
        try {
            String oldAvatar = imgRepository.findById(imgId).get().getUrl();
//            if (oldAvatar != null) {
//                driveManager.deleteFile(oldAvatar.split("id=")[1]);
//            }
            imgRepository.deleteImage(imgId);
            return new ResponseEntity<>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }

    }

    @GetMapping("/get-images/{poiId}")
    public ResponseEntity<ArrayList<POIImageUpdateDTO>> getPOIImageUpdate(@PathVariable("poiId") int poiId) {
        try {
            ArrayList<POIImageUpdateDTO> images = imgRepository.getPOIImagesUpdate(poiId);
            if (images.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(images, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    @PostMapping("/addRate")
    public ResponseEntity addRate(@RequestBody RatingRequest request){
        service.addRating(request);
        return ResponseEntity.ok(service.getproductsReviews(request.getProduct()));
    }
}
