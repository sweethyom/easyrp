package co.second.easyrp.productmgmt.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.second.easyrp.productmgmt.service.UnitService;
import co.second.easyrp.productmgmt.service.UnitVO;

@Controller
public class UnitController {
	
	@Autowired
	UnitService unitService;


	@GetMapping("/unitmodal")
	public String unitModal() {
		return "easyrp/unit/modal/unit";
	}
	
	@GetMapping("/setvalueunitmodal")
	public String setValueUnitModal() {
		return "easyrp/unit/modal/setvalueunitmodal";
	}
	
	@GetMapping("/setvaluemgmtunitmodal")
	public String setValueMgmtUnitModal() {
		return "easyrp/unit/modal/setvaluemgmtunitmodal";
	}
	
	@GetMapping("/api/get-unit")
	@ResponseBody
	public List<UnitVO> getUnitData() {
		return unitService.unitTableAllList();
	}
	
	@PostMapping("/unitinsertfn")
	@ResponseBody
	public String unitInsertFn(UnitVO unitVO,Model model) {
		unitService.unitInsertFn(unitVO);
		return "complete";
	}
	
	@PostMapping("/unitupdatefn")
	@ResponseBody
	public String unitUpdateFn(UnitVO unitVO) {
		unitService.unitUpdateFn(unitVO);
		return "complete";
	}
	
	@PostMapping("/unitdeletefn")
	@ResponseBody
	public String unitDeleteFn(UnitVO unitVO) {
		unitService.unitDeleteFn(unitVO);
		return "complete";
	}
}
