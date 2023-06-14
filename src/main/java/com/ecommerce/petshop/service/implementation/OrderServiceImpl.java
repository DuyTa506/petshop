package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.dto.response.DashboardStat;
import com.ecommerce.petshop.dto.response.PieChartData;
import com.ecommerce.petshop.dto.response.PieData;
import com.ecommerce.petshop.dto.response.PieSmallData;
import com.ecommerce.petshop.entity.*;
import com.ecommerce.petshop.repository.CategoryRepository;
import com.ecommerce.petshop.repository.CustomerRepository;
import com.ecommerce.petshop.repository.OrderDetailRepository;
import com.ecommerce.petshop.repository.OrderRepository;
import com.ecommerce.petshop.service.interfaces.BrandService;
import com.ecommerce.petshop.service.interfaces.CartService;
import com.ecommerce.petshop.service.interfaces.CategoryService;
import com.ecommerce.petshop.service.interfaces.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.awt.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    CartService cartService;

    @Autowired
    BrandService brandService;

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public List<Order> getAllOrderOfCustomer(long id) {
        return null;
    }

    @Override
    @Transactional
    public void cartToOrder(int cartId) {
        Cart cart = cartService.getCartById(cartId);
        if (cart == null) {
            return;
        } else {
            Order order = new Order();
            order.setCustomer(cart.getCustomer());
            order = orderRepository.save(order);
            for (CartDetail cartDetail : cart.getCartDetails()) {
                orderDetailRepository.insertOrderDetails(order.getId(), cartDetail.getProduct().getId(), cartDetail.getQuantity());
            }
        }
    }

    @Override
    public DashboardStat getStat() {
        DashboardStat stat = new DashboardStat();
        stat.setRevenue(orderDetailRepository.getRevenue());
        stat.setNumberOfCustomers(customerRepository.getNumberCustomer());
        stat.setNumberOfSoldProducts(Math.toIntExact(orderDetailRepository.getNumberOfSoldProduct()));
        stat.setNumberOfOrders(orderRepository.getOrderCount());
        List<Brand> brandList = brandService.getBrands();
        List<PieData> brandData = new ArrayList<>();
        PieChartData data = new PieChartData();
        List<String> labelsBrand = new ArrayList<>();
        List<PieSmallData> smallData = new ArrayList<>();
        PieSmallData pieSmallData = new PieSmallData();
        List<BigDecimal> brandValues = new ArrayList<>();
        List<String> brandColor = new ArrayList<>();
        for (Brand brand : brandList) {
            labelsBrand.add(brand.getBrandName());
            BigDecimal result = orderDetailRepository.getNumberOfBrandsSold(brand.getBrandId());
            if (result == null) {
                brandValues.add(BigDecimal.valueOf(0));
            } else {
                brandValues.add(result);
            }
            Color color = new Color((int) (Math.random() * 0x1000000));
            String stringColor = "rgba(" + color.getRed() + "," + color.getGreen() + "," + color.getBlue() + ",0.2)";
            brandColor.add(stringColor);
        }
        pieSmallData.setData(brandValues);
        pieSmallData.setLabel("Doanh thu: ");
        pieSmallData.setBackgroundColor(brandColor);
        pieSmallData.setBorderWidth(1);
        smallData.add(pieSmallData);
        data.setLabels(labelsBrand);
        data.setDatasets(smallData);
        stat.setBrand(data);
        List<Category> categoryList = categoryRepository.findByDeletedIsFalse();

        PieChartData categoryData = new PieChartData();
        List<String> labelsCate = new ArrayList<>();
        List<PieSmallData> smallCateData = new ArrayList<>();
        PieSmallData pieSmallCateData = new PieSmallData();
        List<BigDecimal> cateValues = new ArrayList<>();
        List<String> cateColor = new ArrayList<>();
        for (Category brand : categoryList) {

            labelsCate.add(brand.getCategoryName());
            BigDecimal result = orderDetailRepository.getNumberOfCategoriesSold(brand.getCategoryId());
            if (result == null) {
                cateValues.add(BigDecimal.valueOf(0));
            } else {
                cateValues.add(result);
            }
            Color color = new Color((int) (Math.random() * 0x1000000));
            String stringColor = "rgba(" + color.getRed() + "," + color.getGreen() + "," + color.getBlue() + ",0.2)";
            cateColor.add(stringColor);

        }
        pieSmallCateData.setBorderWidth(1);
        pieSmallCateData.setBackgroundColor(cateColor);
        pieSmallCateData.setLabel("Doanh thu: ");
        pieSmallCateData.setData(cateValues);
        smallCateData.add(pieSmallCateData);
        categoryData.setDatasets(smallCateData);
        categoryData.setLabels(labelsCate);
        stat.setCategory(categoryData);


        return stat;
    }

    @Override
    public List<Order> getOrderOfCustomer(Long id) {
        List<Order> order = new ArrayList<Order>();
        if( orderRepository.getOrderByCustomer(id) != null ){
            order = orderRepository.getOrderByCustomer(id);
        }
        return order;
    }


}
