package co.second.easyrp.productmgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.productmgmt.service.ProductGroupService;
import co.second.easyrp.productmgmt.service.ProductGroupVO;
import co.second.easyrp.productmgmt.service.UnitVO;

@Controller
public class ProductGroupController {

	@Autowired
	ProductGroupService productGroupService;

	@GetMapping("/productgroupmodal")
	public String productGroupModal() {
		return "easyrp/productgroup/modal/productgroup";
	}

	@GetMapping("/api/get-productgroup")
	@ResponseBody
	public List<ProductGroupVO> getProdGroupData() {
		return productGroupService.tableAllList();
	}

	@GetMapping("/searchproductgroupmodal")
	public String warehouseModal() {
		return "easyrp/productgroup/modal/searchproductgroupmodal";
	}

	@PostMapping("/productgroupinsertfn")
	@ResponseBody
	public String productGroupInsertFn(ProductGroupVO productGroupVO) {
		productGroupService.insertFn(productGroupVO);
		return "complete";
	}

	@PostMapping("/productgroupupdatefn")
	@ResponseBody
	public String productGroupUpdateFn(ProductGroupVO productGroupVO) {
		productGroupService.updateFn(productGroupVO);
		return "complete";
	}

	@PostMapping("/productgrodeletefn")
	@ResponseBody
	public String productGroupDeleteFn(ProductGroupVO productGroupVO) {
		productGroupService.deleteFn(productGroupVO);
		return "complete";
	}

}
