module Adapters
  class DocumentPrivacyFilter
    #Adapters::TaskPrivacyFilter.get_tasks
    class << self
      def get_docs(current)
        if current.rol < 4
          all_docs = Document.all
        else
          my_cases = Adapters::CausePrivacyFilter.get_causes(current)
          my_ccs = Adapters::CcPrivacyFilter.get_cc(current)
          my_ders = Adapters::DerivationPrivacyFilter.get_derivations(current)
          my_goals = Adapters::GoalPrivacyFilter.get_goals(current)
          my_iics = Adapters::IicPrivacyFilter.get_iic(current)
          my_projects = Adapters::ProjectPrivacyFilter.get_projects(current)
          my_tasks = Adapters::TaskPrivacyFilter.get_tasks(current)

          all_docs = []
          my_cases.each do |cause|
            all_docs = all_docs + cause.documents
          end
          my_ccs.each do |cc|
            all_docs = all_docs + cc.documents
          end
          my_ders.each do |der|
            all_docs = all_docs + der.documents
          end
          my_goals.each do |goal|
            all_docs = all_docs + goal.documents
          end
          my_iics.each do |iic|
            all_docs = all_docs + iic.documents
          end
          my_projects.each do |project|
            all_docs = all_docs + project.documents
          end
          my_tasks.each do |task|
            all_docs = all_docs + task.documents
          end
          all_docs = all_docs.uniq
        end
        all_docs
      end
    end
  end
end