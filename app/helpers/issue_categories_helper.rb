# frozen_string_literal: true

# Redmine - project management software
# Copyright (C) 2006-2020  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

module IssueCategoriesHelper

  def category_filtered_issues_path(category, options = {})
    options = {:category_id => category, :set_filter => 1}.merge(options)
    project = case category.sharing
      when 'hierarchy', 'tree'
        if version.project && category.project.root.visible?
          category.project.root
        else
          category.project
        end
      when 'system'
        nil
      else
        category.project
    end

     if project
      project_issues_path(project, options)
    else
      issues_path(options)
    end
  end

end
