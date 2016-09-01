module JournalHelper

	def get_pupil_mark(pupil,lesson)
		 lesson.marks.where(pupil: pupil).last != nil ? lesson.marks.where(pupil: pupil).last.mark : ''
	end
end
