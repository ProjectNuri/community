package com.world.nuri.services.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.world.nuri.services.model.ContentTag;
import com.world.nuri.services.model.Tag;

@Service
@Transactional
public class ContentTagService extends GenericService<ContentTag> {
	
	public List<ContentTag> listByTags(List<Tag> tags) {
		String where = " where tagId in (";
		for (int i=0; i<tags.size(); i++) {
			where += tags.get(i).getId();
			if (i != tags.size()-1)
				where += ", ";
		}
		
		where += ") group by id, contentId";
		
		return em.createNativeQuery(SELECT_ALL_SQL + where, clazz).getResultList();
	}

}
