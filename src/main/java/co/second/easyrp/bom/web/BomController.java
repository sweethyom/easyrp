package co.second.easyrp.bom.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.bom.service.BomService;
import co.second.easyrp.bom.service.BomVO;

@Controller
public class BomController {

	@Autowired
	BomService bomService;

	@GetMapping("/bominsert")
	public String bomInsert() {
		return "easyrp/bom/bominsert";
	}

	@GetMapping("/bomdetail")
	public String bomDetail(@RequestParam("prodCod") String prodCod, Model model) {
		List<BomVO> getBomDetailData = bomService.getBomDetailData(prodCod);
		System.out.println(getBomDetailData);

		model.addAttribute("getBomDetailData", getBomDetailData);
		return "easyrp/bom/bomdetail";
	}

	@PostMapping("/bominsertfn")
	public String insertBom(BomVO bomVO) {
		for (BomVO bom : bomVO.getBomList()) {
			bom.setProdCod(bomVO.getProdCod());
			bomService.insertBom(bom);
		}
		bomService.insertStdprice(bomVO);
		return "redirect:/productmgmt";
	}

	@Transactional
	@PostMapping("/bomupdatefn")
	public String updateBom(BomVO bomVO) {
		try {
			bomService.deleteBom(bomVO);

			for (BomVO bom : bomVO.getBomList()) {
				bom.setProdCod(bomVO.getProdCod());
				bomService.insertBom(bom);
			}

			bomService.insertStdprice(bomVO);

			return "redirect:/productmgmt";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/error";
		}
	}

	@PostMapping("/api/get-hyunwoo-productdata")
	@ResponseBody
	public List<BomVO> getHyunwooProductData() {
		return bomService.getHyunwooProductData();
	}

	@GetMapping("/setvalueproductdata")
	public String setValueProductData() {
		return "easyrp/bom/modal/setvalueproductdata";
	}

}
