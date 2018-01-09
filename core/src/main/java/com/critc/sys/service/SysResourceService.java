package com.critc.sys.service;

import com.critc.sys.dao.SysResourceDao;
import com.critc.sys.model.SysResource;
import com.critc.util.cache.EhCacheUtil;
import com.critc.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 系统资源Service
 *
 * @author 孔垂云
 * @date 2017-06-13
 */
@Service
public class SysResourceService {

    @Autowired
    private SysResourceDao sysResourceDao;

    /**
     * 新增前判断代码是否唯一
     *
     * @param sysResource
     * @return
     */
    public int add(SysResource sysResource) {
        //判断代码是否一致
        SysResource exist = sysResourceDao.getByModuleCode(sysResource.getCode());
        if (exist != null)
            return 2;
        else
            return sysResourceDao.add(sysResource);
    }

    public int update(SysResource sysResource) {
        return sysResourceDao.update(sysResource);
    }

    /**
     * 删除资源，先判断是否有下级资源，有的话提示不允许删除
     * 删除时同时删除该资源对应的功能
     *
     * @param id
     * @return
     */
    public int delete(int id) {
        if (sysResourceDao.getChildCount(id) > 0)
            return 2;
        else {
            sysResourceDao.deleteByParentId(id);
            return sysResourceDao.delete(id);
        }
    }

    public SysResource get(int id) {
        return sysResourceDao.get(id);
    }

    /**
     * 根据类型来获取所有资源
     *
     * @param type
     * @return
     */
    public List<SysResource> listByType(int type) {
        return sysResourceDao.listByType(type);
    }

    /**
     * 模块列表，递归生成，用于显示treeGrid
     *
     * @return
     */
    public List<SysResource> list() {
        List<SysResource> list = sysResourceDao.listByType(1);//获取所有模块
        List<SysResource> listRet = new ArrayList<>();
        listRet = createModuleList(list, listRet, 0);
        return listRet;
    }

    /**
     * 模块列表，角色设置时用到
     *
     * @return
     */
    public List<SysResource> listByIsbuildin(int parentId) {
        List<SysResource> list = sysResourceDao.listByType(1);//获取所有模块
        List<SysResource> listRet = new ArrayList<>();
        listRet = createModuleList(list, listRet, parentId);
        return listRet;
    }

    private List<SysResource> createModuleList(List<SysResource> list, List<SysResource> listRet, int parentId) {
        for (SysResource sysModule : list) {
            if (sysModule.getParentId() == parentId) {
                listRet.add(sysModule);
                if (sysModule.getCnt() > 0) {
                    listRet = createModuleList(list, listRet, sysModule.getId());
                }
            }
        }
        return listRet;
    }


    public int getChildCount(int id) {
        return sysResourceDao.getChildCount(id);
    }

    /**
     * 模块列表，递归生成，用于显示treeGrid
     *
     * @return
     */
    public List<SysResource> listByParentId() {
        List<SysResource> list = sysResourceDao.listByType(1);//获取所有模块
        List<SysResource> listRet = new ArrayList<>();
        listRet = createModuleList(list, listRet, 1);
        return listRet;
    }

    /**
     * 生成Ztree的树节点,新增模块时使用，只有模块上下级
     *
     * @return
     */
    public String createZtreeByModule() {
        List<SysResource> listModule = sysResourceDao.listByType(1);// 模块列表
        StringBuilder sb = new StringBuilder();
        for (SysResource sysModule : listModule) {
            sb.append("{id : \"" + sysModule.getId() + "\",pId :\"" + sysModule.getParentId() + "\",name :\"" + sysModule.getName() + "\",open : false");
            sb.append("},");
        }
        return StringUtil.subTract(sb.toString());
    }

    /**
     * 根据parentId获取下面的所有功能
     *
     * @param parentId
     * @return
     */
    public List<SysResource> listByParentId(int parentId,int type) {
        return sysResourceDao.listByParentId(parentId,type);
    }

    /**
     * 从缓存中获取所有资源
     *
     * @return
     */
    public HashMap<String, SysResource> getAllResource() {
        HashMap<String, SysResource> hashMap = EhCacheUtil.get("sysCache", "sysAllResource");
        if (hashMap == null) {
            hashMap = new HashMap<>();
            List<SysResource> listResource = sysResourceDao.list();// 资源列表
            for (SysResource sysResource : listResource) {
                if (!sysResource.getUrl().equals("#")) {
                    hashMap.put(sysResource.getUrl(), sysResource);
                }
            }
            EhCacheUtil.put("sysCache", "sysAllResource", hashMap);
        }
        return hashMap;
    }

}
